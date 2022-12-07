package Controller;

import domain.Member;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import repository.MemberRepository;

@Controller
public class MemberController {

    @GetMapping(value = "/login")
    public String login() {
        return "loginForm";
    }

    @PostMapping(value = "/login")
    public String doLogin(@ModelAttribute Member member, HttpServletRequest request) throws SQLException {
        MemberRepository memberRepository = new MemberRepository();
        HttpSession session = request.getSession();
        Member loginMember = memberRepository.selectUser(member.getEmail())
                                             .orElseThrow(() -> new IllegalArgumentException("유효하지 않은 회원 정보입니다."));
        session.setAttribute("memberNo", loginMember.getMemberNo());

        // TODO 회원번호로 트리있는지 없는지 체크하고 있으면 트리 메인으로 보내고 없으면 트리 생성 페이지로 보내기
        // TODO 트리 수정이나 삭제 기능 추가하면 좋을듯
        return "/tree/{treeNo}";
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

    @ExceptionHandler(Exception.class)
    public String error(Exception e, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", e.getMessage());
        return "redirect:/error";
    }

    @GetMapping("/error")
    public String errorPage() {
        return "error";
    }

}
