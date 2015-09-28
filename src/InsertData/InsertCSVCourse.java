package InsertData;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.jasper.tagplugins.jstl.core.If;

import Dashboard.DatabaseConnector;

/**
 * Servlet implementation class InsertUpload
 */
@WebServlet("/InsertCSVCourse")
@MultipartConfig
public class InsertCSVCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hiveInsertSum = "";
		boolean AddisFail = true;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/InsertCSVCourse.jsp");
		Part filePart = request.getPart("file");

		
		String txtSplitBy = ",";
		BufferedReader br = new BufferedReader(new InputStreamReader(filePart.getInputStream(), "UTF-8"));
		System.out.println(br);
		// BufferedReader br = new BufferedReader(new FileReader("c:\\Student-Template.csv"));
		String line;
		StringBuilder builder = new StringBuilder();
		builder.append("insert into table dw.course0  values ");

		ArrayList<String> parameters = new ArrayList<String>();
		
		br.readLine();
		while ((line = br.readLine()) != null) {
			// use comma as separator
			System.out.println(line);

			String[] cols = line.split(txtSplitBy);

			builder.append("(?,?,?,?,?,?,?,?,?),");
			
			for(int i = 0;i<9;i++){
				parameters.add(cols[i]);
			}
		}
		builder.deleteCharAt(builder.length() - 1);
		hiveInsertSum = builder.toString();
		try {
			Connection con = DatabaseConnector.getConnection();
			PreparedStatement stmt = con.prepareStatement(hiveInsertSum);
			
			int size = parameters.size();
			for(int i =0;i<size;i++){
				stmt.setString(i+1, parameters.get(i));
			}

			System.out.println("hiveInsertSum ::" + hiveInsertSum);
			stmt.executeUpdate();

			request.setAttribute("AddisFail", false);
			System.out.println("AddisFail:" + request.getAttribute("AddisFail"));

			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("AddisFail", true);
			dispatcher.forward(request, response);
		}

		br.close();

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("InsertCSVCourse.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		processRequest(request, response);

	}

}
