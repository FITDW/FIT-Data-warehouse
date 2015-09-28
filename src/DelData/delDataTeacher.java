package DelData;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
@WebServlet("/delDataTeacher")
public class delDataTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean DelisFail = true;
       
	protected void processRequest (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("isSuc before = "+DelisFail);  
		
		String Teacher_id = request.getParameter("deleteTeacher_id");
		System.out.println("Teacher_id :"+Teacher_id);
		HttpServletResponse res = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		
		
		try {
			if(!(Teacher_id == null)){
			Connection con = DatabaseConnector.getConnection();
		    Statement stmt = con.createStatement();
		    
		
		    String hivequery = "delete from dw.teacher where Teacher_id= '"+Teacher_id+"'";
		    System.out.println(hivequery);
		    
		    //Log File
		    DelisFail = stmt.execute(hivequery);
		    /*DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy,HH:mm:ss");
		    Date date = new Date();
		    System.out.println(dateFormat.format(date)+"    Fetch : "+ hivequery +"     Fetch by : "+session.getAttribute("username"));
		    String hiveInsertLog = new String("insert into table dw.log  values " + "('" + dateFormat.format(date) + "','"
					+ "Delete Teacher_id : "+ Teacher_id + "','" + session.getAttribute("username")  +"')");
		    stmt.execute(hiveInsertLog); */
		    request.setAttribute("DelisFail",false);
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertCSVTeacher.jsp");
		    dispatcher.forward(request,response);
		    
		    
		    
		    
			}else {
				 request.setAttribute("DelisFail",true);
				 res.sendRedirect("InsertCSVTeacher.jsp");
			}
		    
		    
		    }catch (Exception e) {
				// TODO: handle exception
		    	e.printStackTrace();
		    	res.sendRedirect("index.jsp");
			}
		
	
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("InsertCSVTeacher.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
