<%@ include file="Header.jsp"%>

<div id="container" style="margin-top: 100px">
	<form class="form-horizontal" role="form" action="LoginDB.jsp" method="POST">
		<div class="form-group">
			<label for="Username" class="col-sm-2 control-label">Brugernavn</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="Username" name="Username">
			</div>
		</div>
		<div class="form-group">
			<label for="Password" class="col-sm-2 control-label">Password</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="Password" name="Password">
				<br />
				<button type="submit" class="btn btn-info">Log ind</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="Footer.jsp"%>