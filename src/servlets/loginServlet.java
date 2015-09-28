package servlets;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.security.MessageDigest;


/**
 * Servlet implementation class queryServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean loginflag = false;
		
		String driverName = "org.apache.hive.jdbc.HiveDriver";
		String userlogin = request.getParameter("txt_username");
		String passlogin = request.getParameter("txt_password");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		
		
		 try {
			 	Class.forName(driverName);
			    Connection con = DriverManager.getConnection("jdbc:hive2://161.246.38.15:10000/dw", "itkmitldw", "itkmitldw504");
			    Statement stmt = con.createStatement();
			    
			    String hivequery = "select * from dw.staff_account where username='"+userlogin+"'";
			    System.out.println(hivequery);
			    ResultSet res = stmt.executeQuery(hivequery);
			    
			    if (res.next()) {
			    	String username = res.getString(2);
				    String password = res.getString(3);
				    String role = res.getString(4);
				    String plaintext_password = passlogin;
			    	MessageDigest m = MessageDigest.getInstance("MD5");
			    	m.reset();
			    	m.update(plaintext_password.getBytes());
			    	byte[] digest = m.digest();
			    	BigInteger bigInt = new BigInteger(1,digest);
			    	String hashtext_password = bigInt.toString(16);
			    	boolean checkuser = userlogin.equals(username);
			    	boolean checkpass = password.equals(hashtext_password);
			    	
			    	
			    	if(checkuser == true && checkpass == true) {
			    		
			    		session.setAttribute("loginFlag",true);
			    		session.setAttribute("username",username);
			    		session.setAttribute("role",role);
			    		System.out.println("session Role:"+session.getAttribute("role"));
			    		System.out.println("Session Flag :" + session.getAttribute("loginFlag"));
			    		
			    		response.sendRedirect("index.jsp");
			    		
			    		
			    	}

			    	
			    	else {
			    		session.setAttribute("loginStatus",false);
			    		response.sendRedirect("login.jsp");
					}
			    	System.out.println("Username(in server) : "+username );
			    	System.out.println("Password(in server) : "+password);
			    	System.out.println("Username(in LoginFrom) : "+userlogin);
			    	System.out.println("Password(in LoginFrom) : "+hashtext_password);
			    	System.out.println("Result Username & Password : "+ checkpass);
			    	
			    	
			    }else {
			    	session.setAttribute("loginStatus",false);
			    	response.sendRedirect("login.jsp");
				}
			    
			    con.close();  
			    
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		processRequest(request, response);
		
	}	
	
	public String getServletInfo() {
		return "Short desscription";
		
	}
	
}
