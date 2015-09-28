package InsertData;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dashboard.DatabaseConnector;

/**
 * Servlet implementation class addUser
 */
@WebServlet("/addUser")
public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	boolean AddisFail=true;
		
		String name_add = request.getParameter("name_add");
		String username_add = request.getParameter("username_add");
		String password_add = request.getParameter("password_add");
		String role_add = request.getParameter("role_add");
		HttpServletResponse res = (HttpServletResponse) response;
		
		try {
		
				Connection con = DatabaseConnector.getConnection();
			    
			    System.out.println("isfail before = "+AddisFail);
			    if(!(name_add==null || username_add==null || password_add==null || role_add==null)){
			    	String plaintext_password = password_add;
			    	MessageDigest m = MessageDigest.getInstance("MD5");
			    	m.reset();
			    	m.update(plaintext_password.getBytes());
			    	byte[] digest = m.digest();
			    	BigInteger bigInt = new BigInteger(1,digest);
			    	String hashtext_password = bigInt.toString(16);
			    	
			    	String hivequery = "insert into table staff_account  values "
			    			+ "('" + name_add + "','"+ username_add + "','" + hashtext_password + "','" + role_add+"')";
			    	System.out.println(hivequery);
			    	PreparedStatement stmt = con.prepareStatement("insert into table staff_account  values (?,?,?,?)");
			    	stmt.setString(1, name_add);
			    	stmt.setString(2, username_add);
			    	stmt.setString(3, hashtext_password);
			    	stmt.setString(4, role_add);
			    	
			    
			    	AddisFail = stmt.execute();
			    	request.setAttribute("AddisFail",false);
			    	System.out.println("isSuc after = "+AddisFail);
			    	con.close();  
			    
			   
			    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manageUser.jsp");
		    	dispatcher.forward(request,response);
		    	
			    }else if ((name_add==null || username_add==null || password_add==null || role_add==null)) {
			    	res.sendRedirect("manageUser.jsp");
				}
			    else {
			    	request.setAttribute("AddisFail",true);
				}
			   
			    
			    
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
			}
		 
	
		
	}



	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("manageUser.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
