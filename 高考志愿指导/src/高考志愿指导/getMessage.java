package 高考志愿指导;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class getMessage {
	public String[] getResult(String kspro,String kemus,float score,int page){
		String sql = "{CALL result_1("+score+","+page+",'%"+kspro+"%','"+kemus+"%')}"; 
		String[] result = null;
		try {
			result = getResults(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return result;			
	}
	public String[] getResult_high(String kspro,String kemus,float score,int page,int year,String scpro,String paiwei,String majn){
		String sql = "{CALL result_high("+score+","+page+","+year+",'"+kspro+"%','"+kemus+"%','"+paiwei+"','%"+majn+"%','%"+scpro+"%')}"; 
		String[] result = null;
		try {
			result = getResults(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.print(sql);
	    return result;			
	}
	public String[] getResults(String sql) throws Exception{
		Mysqls mysql=new Mysqls();
		List<String> allLIst1=new ArrayList<String>();
		ResultSet rs=null;	
		if(mysql.createConn()){
			CallableStatement cs = mysql.query3(sql);
			boolean hadResults = mysql.query5(cs);  
		     int i=0;  
		      while (hadResults) {    
		    	  if(i==1){ 
			          rs = mysql.query4(cs);  
			          while (rs != null && mysql.next(rs)) {  
			        	  allLIst1.add(mysql.getValue("rowcount",rs));  
			          }  
		    	  } 
		    	  else{
		    		 rs = mysql.query4(cs);
					for(;mysql.next(rs);){
						allLIst1.add(mysql.getValue("kaoshengprovince",rs));
						allLIst1.add(mysql.getValue("kemu",rs));
						allLIst1.add(mysql.getValue("code",rs));
						allLIst1.add(mysql.getValue("schoolname",rs));
						allLIst1.add(mysql.getValue("schoolprovince",rs));
						allLIst1.add(mysql.getValue("majorname",rs));
						allLIst1.add(mysql.getValue("avescore_2013",rs));
						allLIst1.add(mysql.getValue("avescore_2014",rs));
						allLIst1.add(mysql.getValue("avescore_2015",rs));
						allLIst1.add(mysql.getValue("avescore_2016",rs));
						allLIst1.add(mysql.getValue("pici",rs));
						}
					}
			      i++;
			      hadResults = mysql.query6(cs); //检查是否存在更多结果集  
			      }  
		     }
		mysql.closeConn();
		mysql.closeRs();
		mysql.closeStm();
	    return allLIst1.toArray(new String[]{});			
	}
}
