<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
 String id=null;
 if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
  out.println("<script>");
  out.println("location.href='loginForm.jsp'");
  out.println("</script>");
 }
 String delete_id=request.getParameter("id");
 Connection conn = null;
 PreparedStatement pstmt =null;
 ResultSet rs = null;
 
 try{
  Context init = new InitialContext();
  DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
  conn=ds.getConnection();
  
  pstmt=conn.prepareStatement("Delete from member where id=?");
  pstmt.setString(1, delete_id);
  pstmt.executeUpdate();
  
  
  out.println("<script>");
  out.println("location.href='member_list.jsp'");
  out.println("</script>");
 }catch(Exception e){
  e.printStackTrace();
 }
%>
 
 
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>삭제 수행</title>
</head>
<body>
 
</body>
</html>
