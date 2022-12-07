package repository;

import domain.Member;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class MemberRepository {
    Connection connection;
    ResultSet rs = null;

    public Optional<Member> selectUser(String email) throws SQLException {
        connection();

        PreparedStatement pre = connection.prepareStatement("select * from member where email = ?");
        pre.setString(1, email);
        rs = pre.executeQuery();

        if (!rs.next()) return Optional.of(null);
        return Optional.of(
            new Member(rs.getInt("member_no"),
                       rs.getString("email"),
                       rs.getString("password")));
    }

    public boolean checkedEmail(String email) throws SQLException {
        connection();

        PreparedStatement pre = connection.prepareStatement("select * from member where email = ?");
        pre.setString(1, email);
        rs = pre.executeQuery();

        return !rs.next();
    }

    public void insert(Member member) throws SQLException {
        connection();

        String sql = "insert into member(member_no, email, password) values (null, ?, ?)";
        PreparedStatement pre = connection.prepareStatement(sql);

        pre.setString(1, member.getEmail());
        pre.setString(2, member.getPassword());

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
