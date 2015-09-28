package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("*.jsp")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		
		Boolean flag = (Boolean) session.getAttribute("loginFlag");
		System.out.println("Loginflag(Filter) :"+session.getAttribute("loginFlag"));
		String tarUrl=((HttpServletRequest)request).getRequestURL().toString();
		String realUrl=tarUrl.split("/")[tarUrl.split("/").length-1];
		
		if ( (realUrl.equals("login.jsp"))  ||  (realUrl.equals("loginServlet"))  ){
			chain.doFilter(request, response);
		}
		
		else{
			boolean loginFlag;
			
				if (flag==null){
					loginFlag = false;
					
				}else {
					loginFlag = flag;
					
					
				}
				if (!loginFlag){
					System.out.println("Resultlogin : False");
					HttpServletResponse res = (HttpServletResponse) response;
					res.sendRedirect("login.jsp");
					
					return;
				}
				System.out.println("Blockpage :"+realUrl);
				
				chain.doFilter(request, response);		
		}	
		
		
		
	

		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
