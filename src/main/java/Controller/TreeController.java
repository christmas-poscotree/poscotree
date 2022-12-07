package Controller;

import domain.TreeDTO;
import java.sql.SQLException;
import java.util.LinkedList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import repository.TreeRepository;


@Controller
public class TreeController {
    TreeRepository dao = new TreeRepository();

    @RequestMapping("/tree")
    public String funcTree(Model model) throws SQLException {
        System.out.println("로그인한 사람 트리");
        return "tree";
    }

    @RequestMapping("/t1")
    public String func5(Model model) throws SQLException {
        System.out.println("function call");
        return "messageForm";
    }

    @RequestMapping("/tree/{tree_no}/{message_no}")
    public String func2(Model model) throws SQLException {
        String message = "message";
        String sender = "sender";

        message = dao.select().getMessage();
        sender = dao.select().getSender();

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
    public String func4(Model model) throws SQLException {
        System.out.println("insert function call");
        LinkedList<TreeDTO> ll = new LinkedList<TreeDTO>();
        ll = dao.selectlistMessage();
        model.addAttribute("list", ll);
        return "messageList";
    }

}
