package Controller;

import domain.TreeDTO;
import java.sql.SQLException;

import java.util.LinkedList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import repository.MessageRepository;

@Controller
public class TreeController {
	MessageRepository dao = new MessageRepository();
	@RequestMapping("/tree")
	public String funcTree(Model model) throws SQLException {
		System.out.println("로그인한 사람 트리");
		return "tree";
	}
}
