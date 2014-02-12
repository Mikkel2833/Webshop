<%@ include file="Header.jsp"%>
<%@ include file="ProtectedSiteChecker.jsp" %>
<div id="container" style="margin-top: 100px">
<%
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");

Integer KundeID = (Integer) session.getAttribute("LoggedIn");

DBHelper db = new DBHelper();

String sqlstatement1 = "SELECT * FROM Webshop.Kunde WHERE Webshop.Kunde.idKunde ="+KundeID+"";
String sqlstatement2 = "UPDATE Webshop.Kunde SET Webshop.Kunde.Password='"+newPassword+"' WHERE Webshop.Kunde.idKunde = "+KundeID+"";

ResultSet rs = db.executeQuery(sqlstatement1);
if (rs.next())
{
	if (rs.getString("Password").equals(oldPassword)) 
	{
		int count = db.executeNonQuery(sqlstatement2);
		if(count == 1)
		{
			%>
			<div class="alert alert-success">Password er opdateret</div>
			<%
		}
	}

	else 
	{
		%>
			<div class="alert alert-danger">Passwords matcher ikke</div>
		<%
	}
}

%>
</div>
<%@ include file="Footer.jsp"%>