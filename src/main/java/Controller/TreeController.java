package Controller;

import domain.Tree;
import domain.TreeDTO;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import repository.MessageRepository;

@Controller
public class TreeController {

    MessageRepository dao = new MessageRepository();

    @RequestMapping("/tree/{tree_no}")
    public String funcTree(@PathVariable("tree_no") Integer treeNo, Model model) throws SQLException {
        // TODO 트리 메인
        LinkedList<TreeDTO> treeDTOS = dao.selectlistMessage(treeNo);
        String treeName = dao.findTreeName(treeNo);
        model.addAttribute("list", treeDTOS);
        model.addAttribute("tree_nm", treeName);

        return "tree";
    }

    @GetMapping(value = "/tree/create")
    public String treeCreate() {
        return "treeCreateForm";
    }

    @PostMapping(value = "/tree/create")
    public String doTreeCreate(@ModelAttribute Tree tree, HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession();
        Integer memberNo = (Integer) session.getAttribute("memberNo");
        tree.setMemberNo(memberNo);
        dao.createTree(tree);
        Integer userTreeNo = dao.findUserTree(memberNo);
        return "redirect:/tree/" + userTreeNo;
    }
}
