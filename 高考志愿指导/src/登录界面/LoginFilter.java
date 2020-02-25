package ��¼����;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ��¼������
 * @author Administrator
 */
@WebFilter(filterName="LoginFilter",
	urlPatterns={"/*"},
	initParams={
			@WebInitParam(name="NotFilterURI", value="/login.jsp;/login_fail.jsp;/LoginServlet")
	},
	dispatcherTypes={DispatcherType.REQUEST})
public class LoginFilter implements Filter {
	private HashMap<String, Integer> NotFilterMap;
	
	// ��URI�е����һ��ȡ����
	protected String getPageName(String v) {
		if (v == null || v.length() == 0) return v;
		int i = v.lastIndexOf("/");
		if (i < 1) 
			return v;
		else
			return v.substring(i);
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// �������˵�URI���ص���ϣ����
		String noFilterURI = filterConfig.getInitParameter("NotFilterURI");
		if (noFilterURI != null && noFilterURI.length() > 0) {
			NotFilterMap = new HashMap<String, Integer>();
			String[] uris = noFilterURI.split(";");
			for (String uri : uris) 
				NotFilterMap.put(uri, 0);
		}
		System.out.println(1);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		
		// �����ַ�������ֹ����
		req.setCharacterEncoding("utf-8");
		
		// ���URI�Ƿ���Ҫ���ˡ���������ˣ���ֱ�ӷ���
		String reqPage = getPageName(req.getRequestURI());
		if (NotFilterMap != null && NotFilterMap.containsKey(reqPage)) {
			chain.doFilter(request, response);
			return;
		}
		
		String username = (String) ((HttpServletRequest) request).getSession().getAttribute("username");
		if (username == null || username.length() == 0)
			((HttpServletResponse)response).sendRedirect("login.jsp");
		else
			chain.doFilter(request, response);
		System.out.println(2);
	}

}
