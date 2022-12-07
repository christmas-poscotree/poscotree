package domain;

public class GSDTO {
	private String id;
	private String pw;
	private String email;
	private String tel;
	GSDTO(){}
	GSDTO(String id, String pw, String email, String tel) {
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.tel = tel;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "GSVO [id=" + id + ", pw=" + pw + ", email=" + email + ", tel=" + tel + "]";
	}
	
}
