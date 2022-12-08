package repository;

import domain.Tree;
import domain.TreeDTO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class MessageRepository {
	
	Connection connection = null;
	ResultSet rs = null;
	String field;
	public TreeDTO select(String tree_no, String message_no) throws SQLException {
//		this.field = field;
		TreeDTO value = null;
		connection();
		
		String sql = ("select * from message where tree_no = ? and message_no = ?");
		PreparedStatement pre = connection.prepareStatement(sql);
		pre.setString(1, tree_no);
		pre.setString(2, message_no);
		System.out.println("field :" + field);
		rs = pre.executeQuery();
		while(rs.next()) {
			value = new TreeDTO(rs.getString(1), rs.getString(3), rs.getString(4));
			System.out.println("rs -----> value");
		}
		System.out.println("value : " + value);
		
		return value;
	}
	
	public LinkedList<TreeDTO> selectlistMessage(Integer tree_no) throws SQLException {

//		this.field = field;
        String[] value = null;
        LinkedList<TreeDTO> ll = new LinkedList<TreeDTO>();
        int i = 0;
        connection();

        String sql = ("select * from message where tree_no = ? order by message_no desc");
        PreparedStatement pre = connection.prepareStatement(sql);
		pre.setInt(1, tree_no);
        System.out.println("field :" + field);
        rs = pre.executeQuery();
        while (rs.next()) {
            ll.add(new TreeDTO(rs.getString(1), rs.getString(3), rs.getString(4)));
            System.out.println("rs -----> value");
        }
//		System.out.println("value : " + value);

        return ll;
    }
	
	public LinkedList<TreeDTO> selectlistMessage1(Integer tree_no) throws SQLException {
		
//		this.field = field;
		String[] value = null;
		LinkedList<TreeDTO> ll = new LinkedList<TreeDTO>();
		int i = 0;
		connection();
		
		String sql = ("select * from message where tree_no = ? order by message_no desc limit 8");
		PreparedStatement pre = connection.prepareStatement(sql);
		pre.setInt(1, tree_no);
		System.out.println("field :" + field);
		rs = pre.executeQuery();
		while (rs.next()) {
			ll.add(new TreeDTO(rs.getString(1), rs.getString(3), rs.getString(4)));
			System.out.println("rs -----> value");
		}
//		System.out.println("value : " + value);
		
		return ll;
	}

    public void insert(TreeDTO dto, String tree_no) throws SQLException {
        connection();

        String sql = "insert into message (tree_no, message, sender, date, checked) values (?, ?, ?, now(), false)";
        PreparedStatement pre = connection.prepareStatement(sql);

        pre.setString(1, tree_no);
        pre.setString(2, dto.getMessage());
        pre.setString(3, dto.getSender());
//		pre.setString(3, dto.getEmail());
//		pre.setString(4, dto.getTel());

        pre.executeUpdate();
    }
    public void delete(String message_no) throws SQLException {
    	connection();
    	
    	String sql = "delete from message where message_no = ?";
    	PreparedStatement pre = connection.prepareStatement(sql);
    	
    	pre.setString(1, message_no);
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

    public void createTree(Tree tree) throws SQLException {
        connection();

        String sql = "insert into tree(tree_no, tree_nm, tree_info, member_no) values (null, ?, ?, ?)";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, tree.getTreeNm());
        pre.setString(2, tree.getTreeInfo());
        pre.setInt(3, tree.getMemberNo());

        pre.executeUpdate();
    }

    public String findTreeName(Integer treeNo) throws SQLException {
        connection();

        String sql = "select tree_nm from tree where tree_no = ?";

        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setInt(1, treeNo);
        rs = pre.executeQuery();

        if (!rs.next()) return null;
        return rs.getString("tree_nm");
    }

    public void connection() throws SQLException {
        String url = "jdbc:mysql://127.0.0.1:3306/db01";
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
