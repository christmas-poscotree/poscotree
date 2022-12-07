package domain;

import java.util.LinkedList;

public class TreeDTO {
	private String message;
	private String sender;
	
	
	LinkedList<Object> ll = new LinkedList<Object>();
	TreeDTO(){}
	public TreeDTO(String message, String sender) {
		this.message = message;
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	@Override
	public String toString() {
		return "TreeDTO [message=" + message + ", sender=" + sender + "]";
	}
	
}
