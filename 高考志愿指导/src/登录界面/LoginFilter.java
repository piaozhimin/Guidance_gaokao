package 登录界面;

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
 * 登录过滤器
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
	
	// 将URI中的最后一截取出来
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
		// 将不过滤的URI加载到哈希表中
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
		
		// 设置字符集，防止乱码
		req.setCharacterEncoding("utf-8");
		
		// 检测URI是否需要过滤。如果不过滤，则直接放行
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
