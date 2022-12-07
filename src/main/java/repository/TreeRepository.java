package repository;

import domain.Member;
import domain.TreeDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Optional;

public class TreeRepository {

    Connection connection = null;
    ResultSet rs = null;
    String field;

    public TreeDTO select() throws SQLException {
//		this.field = field;
        TreeDTO value = null;
        connection();

        String sql = ("select * from message");
        PreparedStatement pre = connection.prepareStatement(sql);
//		pre.setString(1, field);
        System.out.println("field :" + field);
        rs = pre.executeQuery();
        while (rs.next()) {
            value = new TreeDTO(rs.getString(3), rs.getString(4));
            System.out.println("rs -----> value");
        }
        System.out.println("value : " + value);

        return value;
    }

    public LinkedList<TreeDTO> selectlistMessage() throws SQLException {
//		this.field = field;
        String[] value = null;
        LinkedList<TreeDTO> ll = new LinkedList<TreeDTO>();
        int i = 0;
        connection();

        String sql = ("select * from message");
        PreparedStatement pre = connection.prepareStatement(sql);
//		pre.setString(1, field);
        System.out.println("field :" + field);
        rs = pre.executeQuery();
        while (rs.next()) {
            ll.add(new TreeDTO(rs.getString(3), rs.getString(4)));
            System.out.println("rs -----> value");
        }
//		System.out.println("value : " + value);

        return ll;
    }

    public void insert(TreeDTO dto) throws SQLException {
        connection();

        String sql = "insert into message (tree_no, message, sender, date, checked) values (1, ?, ?, now(), false)";
        PreparedStatement pre = connection.prepareStatement(sql);

        pre.setString(1, dto.getMessage());
        pre.setString(2, dto.getSender());
//		pre.setString(3, dto.getEmail());
//		pre.setString(4, dto.getTel());

        pre.executeUpdate();
    }

	public Integer findUserTree(Integer memberNo) throws SQLException {
		connection();

		String sql = "select * from tree where member_no = ?";
		PreparedStatement pre = connection.prepareStatement(sql);
		pre.setInt(1, memberNo);
		rs = pre.executeQuery();

		if (!rs.next()) return null;
		return rs.getInt("tree_no");
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
