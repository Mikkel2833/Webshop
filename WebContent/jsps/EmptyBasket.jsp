<%@ include file="Header.jsp" %>
<%
request.getSession().removeAttribute("SHOPPING_BASKET");
response.sendRedirect("Products.jsp");
%>
<%@ include file="Footer.jsp" %>