package Controller;

import domain.Member;
import java.sql.SQLException;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import repository.MemberRepository;
import repository.MessageRepository;

@Controller
public class MemberController {

    @GetMapping(value = "/login")
    public String login() {
        return "loginForm";
    }

    @PostMapping(value = "/login")
    public String doLogin(@ModelAttribute Member member, HttpServletRequest request) throws SQLException {
        MemberRepository memberRepository = new MemberRepository();
        MessageRepository treeRepository = new MessageRepository();
        HttpSession session = request.getSession();
        Member loginMember = memberRepository.selectUser(member.getEmail())
                                             .orElseThrow(() -> new IllegalArgumentException("유효하지 않은 회원 정보입니다."));
        if (!Objects.equals(member.getPassword(), loginMember.getPassword())) {
             throw new IllegalArgumentException("비밀번호가 유효하지 않습니다.");
        }

        session.setAttribute("memberNo", loginMember.getMemberNo());

        Integer userTreeNo = treeRepository.findUserTree(loginMember.getMemberNo());
        if (Objects.isNull(userTreeNo)) {
            return "redirect:/tree/create";
        } else {
            return "redirect:/tree/" + userTreeNo;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        request.getSession(true);
        return "redirect:/";
    }

    @GetMapping(value = "/signup")
    public String signup() {
        return "signupForm";
    }

    @PostMapping(value = "/signup")
    public String doSignup(@ModelAttribute Member member) throws SQLException {
        MemberRepository memberRepository = new MemberRepository();
        if (memberRepository.checkedEmail(member.getEmail())) {
            memberRepository.insert(member);
        } else {
            throw new IllegalArgumentException("이미 가입된 이메일입니다.");
        }
        return "redirect:/";
    }

    @ExceptionHandler({Exception.class})
    public String error(Exception e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", e.getMessage());
        return "redirect:/error";
    }

    @GetMapping("/error")
    public String errorPage() {
        return "error";
    }

}
