package org.wso2.security.demo.headersecurity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute(Constants.SESSION_ATTRIBUTE_USER) == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute(Constants.SESSION_ATTRIBUTE_USER) == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/pages/index.jsp").forward(request, response);
	}


}
