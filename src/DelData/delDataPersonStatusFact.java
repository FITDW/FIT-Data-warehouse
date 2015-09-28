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
@WebServlet("/delDataPersonStatusFact")
public class delDataPersonStatusFact extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean DelisFail = true;
       
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("isSuc before = "+DelisFail);  
		
		String personal_status_id = request.getParameter("deletepersonal_status_id");
		System.out.println("personal_status_id :"+personal_status_id);
		HttpServletResponse res = (HttpServletResponse) response;
		
		
		
		try {
			if(!(personal_status_id == null)){
			Connection con = DatabaseConnector.getConnection();
		    Statement stmt = con.createStatement();
		    
		
		    String hivequery = "delete from dw.personal_status_fact where personal_status_id= '"+personal_status_id+"'";
		    System.out.println(hivequery);
		    
		    
		    DelisFail = stmt.execute(hivequery);
		   
		      
		    request.setAttribute("DelisFail",false);
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UpdateCSVPersonStatusFact.jsp");
		    dispatcher.forward(request,response);
		    
		    
		    
		    
			}else {
				 request.setAttribute("DelisFail",true);
				 res.sendRedirect("UpdateCSVPersonStatusFact.jsp");
			}
		    
		    
		    }catch (Exception e) {
				// TODO: handle exception
		    	e.printStackTrace();
		    	res.sendRedirect("index.jsp");
			}
		
	
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("UpdateCSVPersonStatusFact.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
