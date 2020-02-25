package 登录界面;

import 高考志愿指导.*;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录处理
 * @author Administrator
 */
@WebServlet(name="LoginServlet",urlPatterns={"/servlet/LoginServlet"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
		System.out.println("LoginServlet.doPost...");
		String from_id = req.getParameter("from_ids");
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String name="";
		boolean result = false;
		HttpSession session = req.getSession();
		if("1".equals(from_id)){
			name="登录";
			result=getUser(username,password);
		}else{			
			name="注册";
			result=setUser(username,password);
		}
		if (result) {		
			session.setAttribute("username", username);
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		} else{
			session.setAttribute("name",name);
			resp.sendRedirect(req.getContextPath()+"/login_fail.jsp");
		}
	}
	public static boolean getUser(String username,String password){
		Mysqls mysql=new Mysqls();
		boolean result=false;
		String sql="{CALL user_result('"+username+"','"+password+"')}";
		System.out.println(sql);
		ResultSet rs=null;	
		int count=0;
		if(mysql.createConn()){
			rs = mysql.query2(sql);
			mysql.next(rs);
			count=Integer.parseInt(mysql.getValue("result",rs));
		}
		mysql.closeConn();
		mysql.closeRs();
		mysql.closeStm();
		if (count==1) {
			result=true;
		}
		return result;
	}
	public static boolean setUser(String username,String password){
		Mysqls mysql=new Mysqls();
		boolean result=false;
		String sql="INSERT INTO `user`(userId,password) VALUES('"+username+"','"+password+"');";
		System.out.println(sql);	
		if(mysql.createConn()){
			result=mysql.execute(sql);	
		}
		mysql.closeConn();
		mysql.closeRs();
		mysql.closeStm();
		return result;
	}
}
