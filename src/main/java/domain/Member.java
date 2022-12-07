package domain;

public class Member {
    private Integer memberNo;
    private String email;
    private String password;

    public Member(Integer memberNo, String email, String password) {
        this.memberNo = memberNo;
        this.email = email;
        this.password = password;
    }

    public Member(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Member() {}

    public void setMemberNo(Integer memberNo) {
        this.memberNo = memberNo;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getMemberNo() {
        return memberNo;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
