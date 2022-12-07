package Controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.TreeDTO;


@Controller
public class TreeController {
	TreeDAO dao = new TreeDAO();
	@RequestMapping("/tree")
	public String func(Model model) throws SQLException {
		System.out.println("로그인한 사람 트리");
		return "tree";
	}
	
	@RequestMapping("/t2") 
	public String func2(
			@RequestParam(value = "id") String id,
			@RequestParam(value = "pw") String pw,
			@RequestParam(value = "email") String email,
			@RequestParam(value = "tel") String tel
			) throws SQLException {
		System.out.println("insert function call");
		
//		dao.insert(id, pw, email, tel);
		return "TigerView";
	}
	
	@RequestMapping("/t3")
	public String func3(TreeDTO dto) throws SQLException {
		System.out.println("insert function call");
		dao.insert(dto);
		return "TigerView";
	}
	
}
