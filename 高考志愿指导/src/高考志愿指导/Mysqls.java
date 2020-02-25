package �߿�־Ըָ��;

import java.sql.CallableStatement;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
public class Mysqls {
 	    private String driver = "com.mysql.jdbc.Driver";  
	    private String url="jdbc:mysql://localhost:3306/gaokaobaokaozhidaoyunfan?characterEncoding=utf8"; 
	    private String username = "root";  
	    private String password = "";  
	    private Connection conn=null;  
	    private Statement stm=null;  
	    private ResultSet rs1=null;
	    private ResultSet rs2=null;
		private CallableStatement cstmt1=null;  
	    //��������  
	    public boolean createConn() {  
	        boolean b = false;  
	        try {  
	        	Class.forName(driver);
	            conn = DriverManager.getConnection(url, username, password);  
	            b = true;  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }// ��ȡ����  
	        catch (ClassNotFoundException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return b;  
	    }  
	    //�������ݱ�1
	    public boolean update(String sql){  
	        boolean b = false;  
	        try {  
	            stm = conn.createStatement(); 
	            stm.executeUpdate(sql);  
	            b = true;  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return b;  
	    }  
	  
	    //�޸�  
	    public boolean execute(String sql){  
	        boolean b = false;  
	        try {  
	            stm = conn.createStatement(); 
	            stm.execute(sql);  
	            b = true;  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return b;  
	    }  
	    //��ѯ(ֱ��ʹ�ò�ѯ���)  
	    public ResultSet query(String sql){  
	        try {  
	            stm = conn.createStatement();  
	            rs1 = stm.executeQuery(sql);  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }
	        return rs1;
	    }  
	  //��ѯ (���ô洢����)
	    public ResultSet query2(String sql){   
	        try {  
	        	cstmt1 = conn.prepareCall(sql);	    
	    		rs2=cstmt1.executeQuery();
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return rs2;  
	    }  
	    /**** �洢���̷��ض�����ʽ��ѯ ****/
	    public CallableStatement query3(String sql){   
	        try {  
	        	cstmt1 = conn.prepareCall(sql);	    
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return cstmt1;  
	    }  
	    public ResultSet query4(CallableStatement cs){   
	        try {  
	        	rs2=cs.getResultSet();    
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return rs2;  
	    }  
	    public boolean query5(CallableStatement cs){   
	    	boolean hadResults = false;
	        try {  
	        	hadResults=cs.execute();    
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return hadResults;  
	    }  
	    public boolean query6(CallableStatement cs){   
	    	boolean hadResults = false;
	        try {  
	        	hadResults=cs.getMoreResults();    
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return hadResults;  
	    } 
	    /********/
	    //�ж���������  
	    public boolean next(ResultSet rsJudge){  
	        boolean b = false;
	        try {  
				if(rsJudge.next()){  
	                b = true;  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return b;  
	    }  

	    //��ȡ���ֶ�ֵ  
	    public String getValue(String field,ResultSet rsJudge) {  
	        String value = null;  
	        try {  
	            if (rsJudge != null) {  
	                value = rsJudge.getString(field);  
	            }
	            //System.out.print(value);
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return value;  
	    }  
	    
	    //�ر�����  
	    public void closeConn() {  
	        try {  
	            if (conn != null) {  
	                conn.close();  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	    }  
	    //�ر�statement  
	    public void closeStm() {  
	        try {  
	            if (stm != null) {  
	                stm.close();  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	    }  
	    //�ر�ResultSet  
	    public void closeRs() {  
	        try {  
	            if (rs1 != null) {  
	                rs1.close();  
	            }  
	            if (rs2 != null) {  
	                rs2.close();  
	            }  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	    }  
	    public String getDriver() {  
	        return driver;  
	    }  
	    public void setDriver(String driver) {  
	        this.driver = driver;  
	    }  
	    public String getUrl() {  
	        return url;  
	    }  
	    public void setUrl(String url) {  
	        this.url = url;  
	    }  
	    public String getUsername() {  
	        return username;  
	    }  
	    public void setUsername(String username) {  
	        this.username = username;  
	    }  
	    public String getPassword() {  
	        return password;  
	    }  
	    public void setPassword(String password) {  
	        this.password = password;  
	    }  
	    public Statement getStm() {  
	        return stm;  
	    }  
	    public void setStm(Statement stm) {  
	        this.stm = stm;  
	    }  
	    public ResultSet getRs1() {  
	        return rs1;  
	    }  
	    public void setRs1(ResultSet rs) {  
	        this.rs1 = rs;  
	    }  
	    public ResultSet getRs2() {  
	        return rs2;  
	    }  
	    public void setRs2(ResultSet rs) {  
	        this.rs2 = rs;  
	    }  
	    public void setConn(Connection conn) {  
	        this.conn = conn;  
	    }  
	    public Connection getConn() {  
	        return conn;  
	    }  
 
}
