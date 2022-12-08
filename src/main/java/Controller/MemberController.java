package Controller;

import domain.Member;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Objects;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import repository.MemberRepository;
import repository.MessageRepository;

@Controller
public class MemberController {
    MemberRepository memberRepository = new MemberRepository();
    MessageRepository treeRepository = new MessageRepository();

    @GetMapping(value = "/login")
    public String login(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession();
        Object memberNo = session.getAttribute("memberNo");
        if (Objects.isNull(memberNo)) {
            return "loginForm";
        } else {
            Integer userTreeNo = treeRepository.findUserTree((Integer) memberNo);
            if (Objects.isNull(userTreeNo)) {
                return "redirect:/tree/create";
            } else {
                return "redirect:/tree/" + userTreeNo;
            }
        }
    }

    @PostMapping(value = "/login")
    public String doLogin(@ModelAttribute Member member, HttpServletRequest request) throws SQLException, NoSuchAlgorithmException {
        HttpSession session = request.getSession();
        Member loginMember = memberRepository.selectUser(member.getEmail())
                                             .orElseThrow(() -> new IllegalArgumentException("유효하지 않은 회원 정보입니다."));
        if (!Objects.equals(MemberController.entyptPassword(member.getEmail(), member.getPassword()), loginMember.getPassword())) {
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
    public String doSignup(@ModelAttribute Member member) throws SQLException, NoSuchAlgorithmException {
        if (memberRepository.checkedEmail(member.getEmail())) {
            member.setPassword(MemberController.entyptPassword(member.getEmail(), member.getPassword()));
            memberRepository.insert(member);
        } else {
            throw new IllegalArgumentException("이미 가입된 이메일입니다.");
        }
        return "redirect:/";
    }

    static String entyptPassword(String id,String pw) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        // 평문+id 암호화
        md.update((id+pw).getBytes());
        return String.format("%064x", new BigInteger(1, md.digest()));
    }

}
