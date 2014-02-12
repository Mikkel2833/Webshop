<%@ include file="Header.jsp"  %>
      	<div id="container" style="margin-top:100px">
      	<%
         String username = request.getParameter("User");
         String passw = request.getParameter("Password");
         String name = request.getParameter("Name");
         String address = request.getParameter("Address");
         String telefone = request.getParameter("Telefone");
         DBHelper db = new DBHelper();
         int result=db.executeNonQuery("INSERT INTO Webshop.Kunde (Navn, Brugernavn, Password, Adresse, Telefon) VALUES ('"+name+"','"+username+"', '"+passw+"','"+address+"','"+telefone+"');");
         if (result > 0)
         {
        	 %>
        	 <div class="alert alert-success">Brugeren er oprettet</div>
        	 <% 
         }
         else
         {
        	 %>
        	 <div class="alert alert-warning">Der skete en fejl, prøv igen</div>
        	 <%
         }
         db.close();
         
         %>
         </div>
<%@ include file="Footer.jsp"  %>