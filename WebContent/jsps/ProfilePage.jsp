<%@ include file="Header.jsp"%>
<%@ include file="ProtectedSiteChecker.jsp"%>
<div id="container" style="margin-top: 100px">
	<%
	if(session.getAttribute("LoggedIn") != null)
	{
		Integer KundeID = (Integer) session.getAttribute("LoggedIn");
		DBHelper db = new DBHelper();
		ResultSet rs = db
				.executeQuery("SELECT * FROM Webshop.Kunde WHERE Webshop.Kunde.idKunde = "
						+ KundeID + "");

		rs.next();
		String Username = rs.getString("Brugernavn");
		String Name = rs.getString("Navn");
		String Address = rs.getString("Adresse");
		int Telefone = Integer.parseInt(rs.getString("Telefon"));
	
	%>
	<div id="container" style="margin-top: 100px">
		<form class="form-horizontal" role="form" action="UpdateProfile.jsp">
			<div class="form-group">
				<label for="Username" class="col-sm-2 control-label">Username</label>
				<div class="col-sm-2">
					<p class="form-control-static"><%=Username%></p>
					<input type="hidden" name="Username" value="<%=Username%>">
				</div>
			</div>
			<div class="form-group">
				<label for="Name" class="col-sm-2 control-label">Navn</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Name" value="<%=Name%>"
						name="Name">
				</div>
			</div>
			<div class="form-group">
				<label for="Address" class="col-sm-2 control-label">Adresse</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Address"
						value="<%=Address%>" name="Address">
				</div>
			</div>
			<div class="form-group">
				<label for="Telefone" class="col-sm-2 control-label">Telefon</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="Telefone"
						value="<%=Telefone%>" name="Telefone"> <br />
					<button type="submit" class="btn btn-info">Opdater info</button>
				</div>
			</div>

		</form>
	</div>
	<%
	}
	%>
</div>
<%@ include file="Footer.jsp"%>