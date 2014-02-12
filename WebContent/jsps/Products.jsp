<%@ include file="Header.jsp" %>
<div id="container" style="margin-top:100px">
	<%
	DBHelper db = new DBHelper();
	ResultSet rs = db.executeQuery("SELECT * FROM Webshop.Vare");
	%>
	<div class="panel panel-default">
	<div class="panel-heading">Produkter</div>
	<table class="table table-striped">
	<!--style="border-spacing: 10px">-->
         <tr>
         	<td><b>Billede</b></td>
            <td><b>Produkt navn</b></td>
            <td><b>Beskrivelse</b>
            <td><b>Pris</b></td>
            <!--<td><b>Actions</b></td>-->
         </tr>
         <% while (rs.next())
         {
         String Name = rs.getString("Navn");
         String Description = rs.getString("Beskrivelse");
         double Price = rs.getDouble("Pris");
         DecimalFormat df = new DecimalFormat("#.00");
         String img = rs.getString("Billede");
         int idVare = rs.getInt("idVare");
         %>
         <tr>
         	<td><img alt = "" src=<%=img%> height="100"></td>
            <td><%out.print(Name);%></td>
            <td><%out.print(Description); %>
            <td><%out.print(df.format(Price) +" DKK");%></td>
            <td>  
               <form action="/Webshop/AddToBasket" method="POST">
                  <input type="hidden" name="productName" value="<%out.print(Name);%>"/> 
                  <input type="hidden" name="description" value="<%out.print(Description);%>"/>
                  <input type="hidden" name="price" value="<%out.print(Price);%>"/> 
                  <input type="hidden" name ="idVare" value="<%out.print(idVare);%>"/>
                  <input type="text" name ="count" value="1" maxlength="2" size="2"/>
                  <input type="submit" value="I KURV" />
               </form>
            </td>
         </tr>
         <%
         }
         rs.close();
         %>
         </form>
         
         <br />
         <% 
      ShoppingBasket basket = (ShoppingBasket)session.getAttribute("SHOPPING_BASKET"); 
      if (basket != null && basket.getItems().size() > 0)
      {%>
         <br/>
         <table>
         <b>Din kurv:</b><br /><br />
            <tr>
               <td><b>Produkt</b></td>
               <td><b>Antal</b></td>
               <td><b>Pris</b></td>
            </tr>
            
           
            <%
            for(Item i : basket.getItems())
            {
               String price = (new DecimalFormat("#.00")).format(i.getPrice());
            %>
               <tr>
                  <td><%=i.getName()%></td>
                  <td><%=i.getCount()%></td>
                  <td><%=price + " DKK"%></td>
               </tr>
          <%} %>
           
            
            <tr>
               <td style="padding-top:10px">
               <b>Total:</b></td>
               <td style="padding-top:10px"></td>
               <td style="padding-top:10px">
                  <%=(new DecimalFormat("#.00")).format(basket.getTotalValue()) + " DKK"%>
               </td>
            </tr>
         </table>
    <%
    } 
      else
      {%>    
      <table>
         <b>Din kurv er tom!</b>
      </table>
    <%}%>
         
	</table>
	<form action="/Webshop/jsps/Checkout.jsp" method="POST">
         		<input type="submit" value="Til betaling"/>
         		</form>
    <form action="/Webshop/jsps/EmptyBasket.jsp" method="POST">
         		<input type="submit" value="Toem kurv"/>
         		</form>
	</div>
</div>
<%@ include file="Footer.jsp" %>