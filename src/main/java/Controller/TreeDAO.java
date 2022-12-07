package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.ui.Model;

import domain.TreeDTO;

public class TreeDAO {
	
	Connection connection;
	ResultSet rs = null;
	
	public void select(Model model) throws SQLException {
		connection();
		
		PreparedStatement pre = connection.prepareStatement("select * from table01");
		System.out.println("select * from table01");
		rs = pre.executeQuery();
		model.addAttribute("pre", pre);
		while(rs.next()) {
			System.out.println(rs.getString(2));
		}
	}
	
	public void insert(TreeDTO dto) throws SQLException {
		connection();
		
		String sql = "insert into table01 (no, id, pw) values (null, ?, ?)";
		PreparedStatement pre = connection.prepareStatement(sql);
		
		pre.setString(1, dto.getId());
		pre.setString(2, dto.getPw());
//		pre.setString(3, dto.getEmail());
//		pre.setString(4, dto.getTel());
		
		pre.executeUpdate();
	}

	public void connection() throws SQLException {
		String url = "jdbc:mysql://192.168.0.198:3306/db01";
		String user = "vote";
		String pwd = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, pwd);
			System.out.println("DB connect Success!!");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}
