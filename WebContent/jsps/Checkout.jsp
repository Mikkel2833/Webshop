<%@ include file="Header.jsp" %>
<%@ include file="ProtectedSiteChecker.jsp" %>
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
               <td style="padding-top:10px"><b>Total:</b></td>
               <td style="padding-top:10px">
                  <%=(new DecimalFormat("#.00")).format(basket.getTotalValue()) + " DKK"%>
               </td>
            </tr>
         </table>
    <%
    } 
      else
      {%>    
         <b>Din kurv er tom!</b>
    <%}%>
         
	</table>
	<form action="ProcessPurchase.jsp" method="POST">
         		<input type="submit" value="Gennemfoer koeb"/>
         		</form>

<%@ include file="Footer.jsp" %>