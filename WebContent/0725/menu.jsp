<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>    
<%-- menu.jsp --%>
 <ul>
  <li><a href="main.do">첫화면</a></li>
  <li><html:link action="/tiles/form">입력폼</html:link></li>
  <li><html:link action="/tiles/login">로그인폼</html:link></li>
 </ul>