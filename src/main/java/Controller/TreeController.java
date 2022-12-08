package Controller;

import domain.Tree;
import domain.TreeDTO;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import repository.MessageRepository;

@Controller
public class TreeController {

    MessageRepository dao = new MessageRepository();

    @RequestMapping("/tree/{tree_no}")
    public String funcTree(@PathVariable("tree_no") Integer treeNo, Model model) throws SQLException {
        LinkedList<TreeDTO> treeDTOS = dao.selectlistMessage1(treeNo);
        Tree treeInfo = dao.findTree(treeNo).orElseThrow(() -> new IllegalArgumentException("트리 번호가 유효하지 않습니다."));

        model.addAttribute("nowMemberNo", treeInfo.getMemberNo());
        model.addAttribute("list", treeDTOS);
        model.addAttribute("tree_nm", treeInfo.getTreeNm());
        model.addAttribute("tree_no", treeNo);

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

    @ExceptionHandler({Exception.class})
    public String error(Exception e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", e.getMessage());
        return "redirect:/error";
    }

}
