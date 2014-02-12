<%@ include file="Header.jsp" %>
<%
	String name = request.getParameter("Username");
	String passw = request.getParameter("Password");

	DBHelper db = new DBHelper();
	ResultSet rs = db
			.executeQuery("select * from Webshop.Kunde where Brugernavn='"
					+ name + "'");
	if (rs.next())

	{
		if (rs.getString("Password").equals(passw)) {
			session.setAttribute("LoggedIn", rs.getInt("idKunde"));
			response.sendRedirect("/Webshop/jsps/Index.jsp");

		} else {
			session.removeAttribute("LoggedIn");
			%>
			<div style="margin-top:100px">
			<div class="alert alert-danger">Forkert password</div>
			</div>
			<%
		}
	} else {
		//out.println("Can't find the requested username");
		%>
		<div style="margin-top:100px">
		<div class="alert alert-warning">Kan ikke finde brugeren</div>
		</div>
		<%
	}
	db.close();
%>
<%@ include file="Footer.jsp" %>