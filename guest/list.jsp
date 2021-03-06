<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록:리스트</title>
</head>
<%--list.jsp --%>
<body>
	<center>
		<h3>방명록:리스트</h3>
		<hr>
		<a href="/TomTest/guest/control?action=form">방명록 쓰기</a>
		<br>
		<br>
		<table border="1" cellpadding="5">
			<tr bgcolor="skyblue">
				<th>번호</th>
				<th>작성자</th>
				<th>전화번호</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
			<c:forEach items="${list }" var="guest">
				<tr>
					<td>${guest.no }</td>
					<td>${guest.writer }</td>
					<td>${guest.tel }</td>
					<td><fmt:formatDate value="${guest.wdate }" pattern="yyyy-MM-dd" /></td>
					<td><a href="/TomTest/guest/control?action=edit&no=${guest.no }">${guest.contents }</a></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		
		<%-- 
		<%
			//방법1
			//현재 페이지 정보 얻어오기
			int pageNo = Integer.parseInt(request.getParameter("page"));
		%>
		<a href="control?action=list&page=<%= pageNo-1%>">이전</a>
		<a href="control?action=list&page=<%= pageNo+1%>">다음</a> 
		--%>
		
		<!--방법2-->
		<!--1) 스스로 해결 함 그러나 코드가 더럽다....-->
		<%-- 		
		<%int pageNo = Integer.parseInt(request.getParameter("page")); %>
		
		<% if (pageNo==1) { //첫 페이지라면 %>
		<input type="button" value="이전">
		<%} else{ %>
		<a href="control?action=list&page=${param.page-1}">이전</a>
		<%} %>
		
		<% if (pageNo==4) { //마지막 페이지라면 %>
		<input type="button" value="다음">
		<%} else{ %>
		<a href="control?action=list&page=${param.page+1}">다음</a> 
		<%} %> 
		--%>
		
		<!--2) 답-->
		<c:if test="${param.page==1}"><input type="hidden" value="이전"></c:if>
		<c:if test="${param.page>1}">
		<a href="control?action=list&page=1"><input type="button" value="첫페이지 이동"></a>
		<br>
		<a href="control?action=list&page=${param.page-1}">이전</a>
		</c:if>
		
		<c:choose>
			<c:when test="${param.page==4}"><input type="hidden" value="다음"></c:when>
			<c:otherwise>
			<a href="control?action=list&page=${param.page+1}">다음</a>
			</c:otherwise>
		</c:choose>
		<hr>
		<c:forEach begin="1" end="${totalPage}" var = "i">
				<a href="control?action=list&page=${i}">${i}</a>
		</c:forEach>
		
		
	</center>
</body>
</html>


