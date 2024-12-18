<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String na = request.getParameter("nam");
    String phn = request.getParameter("phone");
    String pass = request.getParameter("pass");
    String sta = request.getParameter("state");
    String add = request.getParameter("add");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cola?user=root&password=rootram31");
        PreparedStatement ps = cn.prepareStatement("INSERT INTO user_info (name, phone, password, state, address) VALUES (?, ?, ?, ?, ?)");
        PreparedStatement ps1 = cn.prepareStatement("INSERT INTO user_ride (name, phone, pickup, dropoff, price) VALUES (?, ?, 0, 0, 0)");
        PreparedStatement ps2 = cn.prepareStatement("INSERT INTO user_deli (name, phone, pickup, dropoff, price) VALUES (?, ?, 0, 0, 0)");
        ps.setString(1, na);       
        ps.setString(2, phn);      
        ps.setString(3, pass);     
        ps.setString(4, sta);     
        ps.setString(5, add);
        int x = ps.executeUpdate();
        if (x > 0) {
            RequestDispatcher rd = request.getRequestDispatcher("page5.html");
            rd.forward(request, response);
        } else {
        	out.println("<a href=page3.html><font size='10'><center>Login Failed</center></size></a>");
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
	
