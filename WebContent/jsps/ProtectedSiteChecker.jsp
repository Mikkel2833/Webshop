<%
   if(session.getAttribute("LoggedIn") == null)
   {
       //response.sendRedirect("../htmls/Login.html");
       response.sendRedirect("Login.jsp");
   }
 %>