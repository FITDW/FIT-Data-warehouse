package InsertData;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestInsert
 */
@WebServlet("/TestInsert")
public class TestInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int countLine=1;
    private String hiveInsertSum="";
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String driverName = "org.apache.hive.jdbc.HiveDriver";
		
	   
		String csvSplitBy = ",";
    BufferedReader br = new BufferedReader(new FileReader("C:\newwwwwwwwwwwwwwwwwwwwwwww.csv"));
    String line ;

            
		
    try {
    	Class.forName(driverName);
	    Connection con = DriverManager.getConnection("jdbc:hive2://161.246.38.15:10000/dw", "itkmitldw", "itkmitldw504");
	    Statement stmt = con.createStatement();
	    hiveInsertSum = "LOAD DATA INPATH 'br' INTO TABLE `dw.student1`";
	    System.out.println("hiveInsertSum ::" + hiveInsertSum);
	    stmt.execute(hiveInsertSum);
	} catch (Exception e) {
		e.printStackTrace();
	}
    
    br.close();


		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
