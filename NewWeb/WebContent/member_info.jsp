<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
 String id=null;
if((session.getAttribute("id")==null)){
 out.println("<script>");
 out.println("location.href='loginForm.jsp'");
 out.println("</script>"); 
}
String info_id=request.getParameter("id");
 
Connection conn=null;
PreparedStatement pstmt=null;
ResultSet rs = null;
 
try{
 Context init = new InitialContext();
 DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
 conn=ds.getConnection();
 
 pstmt=conn.prepareStatement("select * from member where id=?");
 pstmt.setString(1, info_id);
 rs = pstmt.executeQuery();
 rs.next();
}catch(Exception e){
 e.printStackTrace();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 보기</title>
</head>
<body>
<center>
<table border=1 width=300>
 <tr align=center><td>아이디:</td><td><%=rs.getString("id") %></td></tr>
 <tr align=center><td>비밀번호 : </td><td><%=rs.getString("password") %></td></tr> 
 <tr align=center><td>나이:</td><td><%=rs.getString("age") %></td></tr>
 <tr align=center><td>성별:</td><td><%=rs.getString("gender") %></td></tr>
 <tr align=center><td>이메일 주소:</td><td><%=rs.getString("email") %></td></tr> 
 <tr align=center><td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
</table>
</center>
</body>
</html>
 
 