<%@ include file="Header.jsp" %>
<%@ include file="ProtectedSiteChecker.jsp" %>
<div id="container" style="margin-top:100px">
<%
DBHelper db = new DBHelper();
ShoppingBasket basket = (ShoppingBasket)session.getAttribute("SHOPPING_BASKET"); 
Integer kundeid = (Integer) session.getAttribute("LoggedIn");

int result = db.executeNonQuery("INSERT INTO Webshop.Ordre(Totalpris, OrdreTidspunkt, idKunde) VALUES("+basket.getTotalValue()+",Now(),"+kundeid+")");
int idOrdre;
//db.close();

ResultSet rs = db.executeQuery("SELECT idOrdre FROM Webshop.Ordre ORDER BY idOrdre DESC LIMIT 1");
//while(rs.next())
//{
	rs.next();
	idOrdre =rs.getInt("idOrdre");
//}
//db.close();

double Totalprice;
String sqlstatement;
boolean purchasemade = false;
for(Item i : basket.getItems())
{
	Totalprice = basket.getTotalValue();
	sqlstatement = "INSERT INTO Webshop.OrdreLinie(idVare, idOrdre, Antal) VALUES("+i.getId()+","+idOrdre+","+i.getCount()+")";
	//out.print(sqlstatement);
	//out.print("<br />");
	int le = db.executeNonQuery(sqlstatement);
	if(le != 0)
		purchasemade = true;
}

if (purchasemade == true)
{
	%>
	<div class="alert alert-success">Dit køb er gennemført</div>
	<%
	request.getSession().removeAttribute("SHOPPING_BASKET");
}
%>
</div>
<%@ include file="Footer.jsp" %>