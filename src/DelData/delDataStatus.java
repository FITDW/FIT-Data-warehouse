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

import Dashboard.DatabaseConnector;


/**
 * Servlet implementation class delDataStudent
 */
@WebServlet("/delDataStatus")
public class delDataStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean DelisFail = true;
       
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("isSuc before = "+DelisFail);  
		
		String Status_ID = request.getParameter("deleteStatus_id");
		System.out.println("Course_id :"+Status_ID);
		HttpServletResponse res = (HttpServletResponse) response;
		
		
		
		try {
			if(!(Status_ID == null)){
			Connection con = DatabaseConnector.getConnection();
		    Statement stmt = con.createStatement();
		    
		
		    String hivequery = "delete from dw.status where status_id= '"+Status_ID+"'";
		    System.out.println(hivequery);
		    
		    
		    DelisFail = stmt.execute(hivequery);
		   
		      
		    request.setAttribute("DelisFail",false);
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertCSVStatus.jsp");
		    dispatcher.forward(request,response);
		    
		    
		    
		    
			}else {
				 request.setAttribute("DelisFail",true);
				 res.sendRedirect("InsertCSVStatus.jsp");
			}
		    
		    
		    }catch (Exception e) {
				// TODO: handle exception
		    	e.printStackTrace();
		    	res.sendRedirect("index.jsp");
			}
		
	
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("InsertCSVStatus.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
