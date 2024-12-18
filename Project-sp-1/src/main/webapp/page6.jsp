<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<%
    String pick = request.getParameter("pick");
    String drop= request.getParameter("drop");
    String dis = request.getParameter("dis");
    String ph = request.getParameter("ppp");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cola?user=root&password=rootram31");
        PreparedStatement ps = cn.prepareStatement("INSERT INTO user_deli (phone, pickup, dropoff,dist,price) VALUES (?,?,?,?,0);");
        PreparedStatement ps1 =cn.prepareStatement("update user_deli set price=?*2 where phone=? and dist=?;");
        ps.setString(1,ph);
        ps.setString(2, pick);       
        ps.setString(3, drop);      
        ps.setString(4, dis);   
        ps1.setString(1,dis);
        ps1.setString(2,ph);
        ps1.setString(3,dis);
        int x = ps.executeUpdate();
        	if(x>0){
            	out.println("<a href=page6.html><font size='10'><center>Transaction Successful</center></font></a>");
        		
        	}
            else{
            	out.println("<a href=page6.html><font size='10'><center>Login Failed</center></size></a>");
            }
        int r=ps1.executeUpdate();
   		ps.close();
        ps1.close();
        cn.close();
        } 
    catch (Exception e){
    	out.println(e);
    }
 %>