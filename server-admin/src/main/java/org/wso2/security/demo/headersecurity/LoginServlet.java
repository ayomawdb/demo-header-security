package org.wso2.security.demo.headersecurity;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Storing user data like this is absolutely wrong. Just doing so for this
	// demo.
	private static final Map<String, String> USER_MAP = new HashMap<String, String>();
	static {
		USER_MAP.put("admin",
				"c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession().getAttribute(Constants.SESSION_ATTRIBUTE_USER) != null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute(Constants.SESSION_ATTRIBUTE_USER) != null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String redirectPath = request.getContextPath() + "/login";
		String message = null;
		
		if(username == null || username.isEmpty()) {
			message = "Please enter username";
		} else if(password == null || password.isEmpty()) {
			message = "Please enter password";
		} else if(USER_MAP.get(username) != null) {
			String hash = DigestUtils.sha512Hex(password);
			if(hash.equals(USER_MAP.get(username))){
				request.getSession().setAttribute(Constants.SESSION_ATTRIBUTE_USER, username);
				redirectPath = request.getContextPath() + "/home";
			} else {
				message = "Incorrect username or password";
			}
		} else {
			message = "Incorrect username or password";
		}
		
		if(message == null) {
			response.sendRedirect(redirectPath);
		} else {
			response.sendRedirect(redirectPath + "?msg=" + URLEncoder.encode(message, "UTF-8"));
		}
	}

}
