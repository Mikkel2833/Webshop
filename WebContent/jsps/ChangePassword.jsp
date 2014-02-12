<%@ include file="Header.jsp"%> 

<div id="container" style="margin-top: 100px">
	<form class="form-horizontal" role="form" action="ChangePasswordDB.jsp" method="POST">
		<div class="form-group">
			<label for="oldPassword" class="col-sm-2 control-label">Nuværende
				password</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="oldPassword"
					placeholder="Nuværende password" name="oldPassword">
			</div>
		</div>
		<div class="form-group">
			<label for="newPassword1" class="col-sm-2 control-label">Nyt
				password</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="newPassword"
					placeholder="Nyt password" name="newPassword">
					<br />
				<button type="submit" class="btn btn-info">Skift password</button>
			</div>
		</div>
	</form>
</div>
