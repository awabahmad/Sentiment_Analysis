package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBC {
	private static Connection connection=null;
	public static Connection OpenDBConnection(){
		String url="jdbc:mysql://localhost:3306/Twitter_Analysis";
		String driver="com.mysql.jdbc.Driver";
		try {
			Class.forName(driver);
			connection=DriverManager.getConnection(url,"root","password");
			return connection;
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return null;
	}
	static public Connection getConnection(){
		OpenDBConnection();
		return connection;
	}
}
