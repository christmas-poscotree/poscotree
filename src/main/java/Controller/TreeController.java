package Controller;

import java.sql.SQLException;
import java.util.LinkedList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.TreeDTO;


@Controller
public class TreeController {
	TreeDAO dao = new TreeDAO();
	@RequestMapping("/tree")
	public String showTree(Model model) throws SQLException {
		System.out.println("트리화면");
		return "tree";
	}
	

	@RequestMapping("/treeCreateForm")
	public String createTree(Model model) throws SQLException {
	System.out.println("트리만들기");
	return "treeCreateForm";
	}

	
	
}
