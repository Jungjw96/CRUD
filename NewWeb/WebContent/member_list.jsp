<%@page import="javax.sound.midi.MidiDevice.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%
String id=null;
if((session.getAttribute("id"))== null ){
 out.println("<script>");
 out.println("location.href='loginForm.jsp'");
 out.println("</script>");
}

Connection conn=null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
 Context init = new InitialContext();
 DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
 conn=ds.getConnection();
 
 pstmt=conn.prepareStatement("select * from member" );
 rs=pstmt.executeQuery();
 
}catch(Exception e){
 e.printStackTrace();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원목록보기</title>
</head>
<body>
<center>
<table border=1 width=500>
 <tr align=center><td colspan=7>회원목록</td></tr>
 <td width=5>아이디</td> <td>비밀번호</td> <td>이름</td> <td>나이</td> <td>성별</td> <td>이메일</td><td>삭제</td>
 
 <%while(rs.next()){ %>
  <tr align=center>
   <td>
    <a href="member_info.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a>
   </td>
   <td><%=rs.getString("password") %></td>
   <td><a><%=rs.getString("name") %></a></td>
   <td><a><%=rs.getString("age") %></a></td>
   <td><a><%=rs.getString("gender") %></a></td>
   <td><a><%=rs.getString("email") %></a></td>
   <td><a href="member_delete.jsp?id=<%=rs.getString("id") %>">삭제</a></td>
  </tr>
 <%} %>
</table>

</center>
</body>
</html>