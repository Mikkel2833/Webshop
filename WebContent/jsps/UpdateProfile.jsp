<%@ page import="dk.mmj.*"%>
<%@ page
	import="java.lang.Object, java.util.ArrayList, java.sql.ResultSet, java.text.DecimalFormat"%>
<%
String Username = request.getParameter("Username");
//String Password = request.getParameter("Password");
String Name = request.getParameter("Name");
String Address = request.getParameter("Address");
String Telefone = request.getParameter("Telefone");

DBHelper db = new DBHelper();
String sqlstatement = "UPDATE Webshop.Kunde SET Webshop.Kunde.Navn ='"+Name+"', Webshop.Kunde.Adresse ='"+Address+"', Webshop.Kunde.Telefon='"+Telefone+"' WHERE Webshop.Kunde.Brugernavn = '"+Username+"'";
int count = db.executeNonQuery(sqlstatement);

if (count == 1)
{
	response.sendRedirect("ProfilePage.jsp");
}
else
{
	%>
	<div class="alert alert-danger">Noget gik galt, prøv igen...</div>
	<%
}
 %>