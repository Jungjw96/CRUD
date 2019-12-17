<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
 

 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정</title>
</head>
<body>

<%
    String id = null;
  
   	id = (String) session.getAttribute("id");
   
    
    
 
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
 
    try{
    	  Context init=new InitialContext(); //커넥션 풀을 이용하게 되면 편리하게 디비연동을 할 수 있다.
    	  DataSource ds =(DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); //아래서 저장한 connection name값을 불러온다.
    	  conn = ds.getConnection();
    	  
    	  pstmt=conn.prepareStatement("select * from member where id=?"); //prepareStatement는 Statement와 다르게 ?로 지정된 값을 필요 할 때 마다 이용할수있다.
    	  pstmt.setString(1,id);
    	  rs=pstmt.executeQuery();
    	  while(rs.next()) {
	%>
    <form name="Modify" action="modifyProcess.jsp" method="post">
        <center>
            <table border=1>
   	             <tr>
                    <td colspan="2" align=center bgcolor="pink"><b><font size=5><%=id %>님 회원 정보
                                수정</font></b></td>
                </tr>
                <tr>
                    <td>비밀번호 :</td> 
                    <td><input type="text" name="password" id="password" value=<%=rs.getString("password")%>></td>
                </tr>
                
                <tr>
                    <td>이름 :</td>
                    <td><input type="text" name="name" size=5></td>
                </tr>
                
                <tr>
                    <td>나이 :</td>
                    <td><input type="text" name="age" size=5 value=<%=rs.getInt("age") %>></td>
                </tr>
 
                <tr>
                    <td>성별</td>
                    <td><input type="radio" name="gender" value="남" checked />남자 <input
                        type="radio" name="gender" value="여" /> 여자</td>
                </tr>
                <tr>
                    <td>이메일 :</td>
                    <td><input type="text" name="email" size=30></td>
                </tr>
                <tr>
                    <td colspan="2" align=center><input type="submit" value="수정">
                    <input type="reset" value="다시 작성"></td>
                </tr>
 
            </table>
            
        </center>
    </form>
        <%
        }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    
</body>
</html>
