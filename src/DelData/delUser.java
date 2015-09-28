package DelData;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dashboard.DatabaseConnector;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

/**
 * Servlet implementation class delUser
 */
@WebServlet("/delUser")
public class delUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean DelisFail = true;
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("isSuc before = "+DelisFail);  
		
		String username = request.getParameter("deleteuser");
		
		HttpServletResponse res = (HttpServletResponse) response;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/manageUser.jsp");
		
		try {
			if(!(username == null)){
			Connection con = DatabaseConnector.getConnection();
		    Statement stmt = con.createStatement();
		    
		
		    String hivequery = "delete from dw.staff_account where username= '"+username+"'";
		    System.out.println(hivequery);
		    
		    
		    DelisFail = stmt.execute(hivequery);
		    request.setAttribute("isDelFail",DelisFail);
		    System.out.println("isSuc after = "+DelisFail);  
		    request.setAttribute("DelisFail",false);
		   
	    	dispatcher.forward(request,response);
		    
		    
		    
		    
			}else {
				 request.setAttribute("DelisFail",true);
				 dispatcher.forward(request,response);
			}
		    
		    
		    }catch (Exception e) {
				// TODO: handle exception
		    	e.printStackTrace();
		    	res.sendRedirect("index.jsp");
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
