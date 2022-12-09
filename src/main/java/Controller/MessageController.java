package Controller;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.Tree;
import domain.TreeDTO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import repository.MessageRepository;


@Controller
public class MessageController {
	MessageRepository dao = new MessageRepository();
	@RequestMapping("/t1")
	public String func1(Model model) throws SQLException {
	System.out.println("function call");
	return "messageMain";
	}
	@RequestMapping("/tree/{tree_no}/MessageForm")
	public String func5(
			Model model,
			@PathVariable("tree_no") String tree_no
			) throws SQLException {
		System.out.println("function call");
		model.addAttribute("tree_No", tree_no);
	return "messageForm";
	}

	@RequestMapping("/tree/{tree_no}/{message_no}")
	public String func3(
			Model model, 
			@PathVariable("tree_no") String tree_no,
			@PathVariable("message_no") String message_no
			) throws SQLException {
		String message = "message";
		String sender = "sender";
		System.out.println(message_no);
		message = dao.select(tree_no, message_no).getMessage();
		sender = dao.select(tree_no, message_no).getSender();
		
		System.out.println(message);
		System.out.println(sender);
		model.addAttribute("message", message);
		model.addAttribute("sender", sender);
		System.out.println("select function call");
		
		return "messageView";
	}
	@DeleteMapping("/tree/{tree_no}/{message_no}")
	public String func11(
			@PathVariable("tree_no") String tree_no,
			@PathVariable("message_no") String message_no
			) throws SQLException {
		dao.delete(message_no);
		
		return "redirect:/tree/" + tree_no + "/message-list";
	}
	
	@RequestMapping("/tree/{tree_no}/send")
	public String func3(
			TreeDTO dto,
			@PathVariable("tree_no") String tree_no
			) throws SQLException {
		System.out.println("insert function call");
		dao.insert(dto, tree_no);
		return "redirect:/tree/" + tree_no;
	}
	
	@RequestMapping("/tree/{tree_no}/message-list")
	public String func4(Model model, @PathVariable Integer tree_no) throws SQLException {
		LinkedList<TreeDTO> ll = new LinkedList<TreeDTO>();		
		ll = dao.selectlistMessage(tree_no);
		Tree treeInfo = dao.findTree(tree_no).orElseThrow(() -> new IllegalArgumentException("트리 번호가 유효하지 않습니다."));
		
		model.addAttribute("list", ll);
		model.addAttribute("treeNo", treeInfo.getTreeNo());
		System.out.println("treeNo : " + treeInfo.getTreeNo());
		System.out.println("treeNo type : " + treeInfo.getTreeNo().getClass().getName());
		return "messageList";
	}
	
}
