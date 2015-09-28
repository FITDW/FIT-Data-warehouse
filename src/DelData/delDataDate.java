package DelData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class delDataStudent
 */
@WebServlet("/delDataDate")
public class delDataDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean DelisFail = true;
       
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("isSuc before = "+DelisFail);  
		
		String Date_key = request.getParameter("deleteDate_key");
		System.out.println("Date_key :"+Date_key);
		HttpServletResponse res = (HttpServletResponse) response;
		
		
		
		try {
			if(!(Date_key == null)){
			Connection con = DatabaseConnector.getConnection();
		    Statement stmt = con.createStatement();
		    
		
		    String hivequery = "delete from dw.date where date_key= '"+Date_key+"'";
		    System.out.println(hivequery);
		    
		    
		    DelisFail = stmt.execute(hivequery);
		   
		      
		    request.setAttribute("DelisFail",false);
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertCSVDate.jsp");
		    dispatcher.forward(request,response);
		    
		    
		    
		    
		    
			}else {
				 request.setAttribute("DelisFail",true);
				 res.sendRedirect("InsertCSVDate.jsp");
			}
		    
		    
		    }catch (Exception e) {
				// TODO: handle exception
		    	e.printStackTrace();
		    	res.sendRedirect("index.jsp");
			}
		
	
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("InsertCSVDate.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
