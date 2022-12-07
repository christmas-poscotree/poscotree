package Controller;

import java.sql.SQLException;
import java.util.LinkedList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.TreeDTO;
import repository.MessageRepository;


@Controller
public class MessageController {
	MessageRepository dao = new MessageRepository();
	@RequestMapping("/t2")
	public String func1(Model model) throws SQLException {
	System.out.println("function call");
	return "messageMain";
	}
	@RequestMapping("/t1")
	public String func5(Model model) throws SQLException {
	System.out.println("function call");
	return "messageForm";
	}

//	@RequestMapping("/tree/{tree_no}/{message_no}") 
//	public String func2(Model model) throws SQLException {
//		String message = "message";
//		String sender = "sender";
//		
//		message = dao.select().getMessage();
//		sender = dao.select().getSender();
//		
//		System.out.println(message);
//		System.out.println(sender);
//		model.addAttribute("message", message);
//		model.addAttribute("sender", sender);
//		System.out.println("select function call");
//		
//		return "messageView";
//	}
	@RequestMapping("/tree/{tree_no}/{message_no}")
	public String func3(
			Model model, 
			@PathVariable("message_no") String message_no
			) throws SQLException {
//		message_no = message1;
		String message = "message";
		String sender = "sender";
		System.out.println(message_no);
		message = dao.select(message_no).getMessage();
		sender = dao.select(message_no).getSender();
		
		System.out.println(message);
		System.out.println(sender);
		model.addAttribute("message", message);
		model.addAttribute("sender", sender);
		System.out.println("select function call");
		
		return "messageView";
	}
	
	@RequestMapping("/tree/{tree_no}/send")
	public String func3(TreeDTO dto) throws SQLException {
		System.out.println("insert function call");
		dao.insert(dto);
		return "messageForm";
	}
	
	@RequestMapping("/tree/{tree_no}/message-list}")
	public String func4(Model model, @PathVariable Integer tree_no) throws SQLException {
		System.out.println("insert function call");
		LinkedList<TreeDTO> ll = new LinkedList<TreeDTO>();
		ll = dao.selectlistMessage(tree_no);
		model.addAttribute("list", ll);
		return "tree";
	}
	
}
