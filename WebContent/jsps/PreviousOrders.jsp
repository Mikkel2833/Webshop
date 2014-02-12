<%@ include file="Header.jsp"%>
<%@ include file="ProtectedSiteChecker.jsp"%>
	<div id="container" style="margin-top: 100px">
	<%
	DBHelper db = new DBHelper();
	//int KundeID = Integer.parseInt(session.getAttribute("LoggedIn"));
	Integer KundeID = (Integer) session.getAttribute("LoggedIn");
	String sqlstatement = "SELECT Webshop.Vare.Billede,Webshop.Ordre.idOrdre,Webshop.Vare.Navn,Webshop.OrdreLinie.Antal,Webshop.Vare.Pris,Webshop.Ordre.TotalPris FROM Webshop.Kunde,Webshop.Vare,Webshop.Ordre,Webshop.OrdreLinie WHERE Webshop.Kunde.idKunde = Webshop.Ordre.idKunde AND Webshop.Ordre.idOrdre = Webshop.OrdreLinie.idOrdre AND Webshop.Vare.idVare = Webshop.OrdreLinie.idVare AND Webshop.Kunde.idKunde ="+KundeID+"";
	ResultSet rs = db.executeQuery(sqlstatement);
	int OrdreId2 = 0;
	int TotalPris2 = 0;
	%>
	<div class="panel panel-default">
		<div class="panel-heading">Tidligere ordre</div>
		<table class="table">
			<tr>
				<td><b>OrdreId</b></td>
				<td><b>Billede</b></td>
				<!--<td><b>OrdreID</b></td> -->
				<td><b>Produkt navn</b></td>
				<td><b>Antal</b></td>
				<td><b>Pris</b></td>
				<td><b>TotalPris</b></td>
			</tr>
			<% 
         while (rs.next())
         {
         int OrdreId = rs.getInt(2);
         String img = rs.getString(1);
         String Navn = rs.getString(3);
         int count = rs.getInt(4);
         double price = rs.getDouble(5);
         double TotalPris = rs.getDouble(6);
         DecimalFormat df = new DecimalFormat("#.00");
         %>
			<tr>
				<%if(OrdreId != OrdreId2)
         {
        	 OrdreId2 = OrdreId;
        	 %>
				<td><b><%=OrdreId%></b></td>
				<% 
         }
         else
         {
        	 %>
				<td></td>
				<% 
         }    
         %>
				<td><img src=<%=img%> height="100"></td>
				<td><%=Navn%></td>
				<td><%=count%>
				<td>
					<%out.print(df.format(price) +" DKK");%>
				</td>
				<td>	
					<%out.print(df.format(TotalPris) + " DKK");%>
				
			</tr>
			<%
         }
         %>
		</table>
	</div>
</div>
<%@ include file="Footer.jsp"%>