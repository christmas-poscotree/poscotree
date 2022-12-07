package domain;

public class MessageDTO {
	String message;
	MessageDTO(){}
	public MessageDTO(String message) {
		this.message = message;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
