package org.wso2.security.demo.headersecurity;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class SecurityFilter
 */
public class SecurityFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//((HttpServletResponse) response).addHeader("X-XSS-Protection", "1; mode=block");
		
		//((HttpServletResponse) response).addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains");
		
		//((HttpServletResponse) response).addHeader("X-Frame-Options", "DENY");
		
		//((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		
		//((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "*");
		//((HttpServletResponse) response).addHeader("Access-Control-Allow-Credentials", "true");
		
		//((HttpServletResponse) response).addHeader("Access-Control-Allow-Origin", "javacolombo-gallery.duckdns.org");
		//((HttpServletResponse) response).addHeader("Access-Control-Allow-Credentials", "true");
		
		//((HttpServletResponse) response).addHeader("Public-Key-Pins", "pin-sha256=\"uIG4d9Hlx699DIzeUKGUlwkluUTk4Fz0q5wY3mlWuRg=\"; pin-sha256=\"tpFbv65QoYvcWNVl7gAEd1FAWWn/pjL8Fo2+f1pTrC8=\"; max-age=5184000; includeSubdomains");
		chain.doFilter(request, response);
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
