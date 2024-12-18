<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection cn= DriverManager.getConnection("jdbc:mysql://localhost:3306/cola?user=root&password=rootram31");
	String ph=request.getParameter("phone");
	String pa=request.getParameter("password");
	PreparedStatement ps= cn.prepareStatement("select * from user_info where phone=? and password=?;");
	ps.setString(1,ph);
	ps.setString(2,pa);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		RequestDispatcher rd=request.getRequestDispatcher("page5.html");
		rd.forward(request,response);
	}
	else{
		out.println("<a href=page2.html><font size='10'><center>Login Failed</center></size></a>");
	}
	ps.close();
	cn.close();
}

catch (ClassNotFoundException e){
	e.printStackTrace();
}
catch (SQLException e){
	e.printStackTrace();
}

%>
