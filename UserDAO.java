package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

public class UserDAO {
	
	private String user_nname = "null";
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	private ResultSet rs;

	public UserDAO() {
		
		
		try{
			String dbURL = "jdbc:mysql://localhost:3306/subau";
			String dbID ="root";
			String dbPassword = "tnwls0326!";
		Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
	}catch(Exception e) {
		e.printStackTrace();
	}
}

public int login (String user_id, String user_pwd) {
	String SQL = "SELECT user_pwd,user_nname FROM USERTBL WHERE user_id= ?";
	try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(user_pwd)) {
					user_nname = rs.getString("user_nname");
					return 1;
				}
				else
					return 0;
			}
			return -1;
	}catch(Exception e) {
		e.printStackTrace();
	}
	return -2;
}
public String getNickName () {
	return user_nname;
}
}