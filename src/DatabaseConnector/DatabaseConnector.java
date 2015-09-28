package DatabaseConnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		String driverName = "org.apache.hive.jdbc.HiveDriver";
		Class.forName(driverName);
		Connection con = DriverManager.getConnection("jdbc:hive2://161.246.38.15:10000/dw", "itkmitldw",
				"itkmitldw504");
		return con;
	}
}
