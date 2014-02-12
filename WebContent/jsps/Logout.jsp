<%@ include file="Header.jsp" %>
<%
request.getSession().removeAttribute("SHOPPING_BASKET");
request.getSession().removeAttribute("LoggedIn");
response.sendRedirect("Index.jsp");
%>
<%@ include file="Footer.jsp" %>