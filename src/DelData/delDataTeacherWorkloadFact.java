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
@WebServlet("/delDataTeacherWorkloadFact")
public class delDataTeacherWorkloadFact extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean DelisFail = true;
       
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("isSuc before = "+DelisFail);  
		
		String teacher_fact_id = request.getParameter("deleteteacher_fact_id");
		System.out.println("teacher_fact_id :"+teacher_fact_id);
		HttpServletResponse res = (HttpServletResponse) response;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UpdateCSVTeacherWorkloadFact.jsp");
		
		try {
			if(!(teacher_fact_id == null)){
			Connection con = DatabaseConnector.getConnection();
		    Statement stmt = con.createStatement();
		    
		
		    String hivequery = "delete from dw.teacher_workload_fact where teacher_fact_id= '"+teacher_fact_id+"'";
		    System.out.println(hivequery);
		    
		    
		    DelisFail = stmt.execute(hivequery);
		   
		      
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
		response.sendRedirect("UpdateCSVTeacherWorkloadFact.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
