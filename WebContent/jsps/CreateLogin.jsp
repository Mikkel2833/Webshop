<%@ include file="Header.jsp" %>
<div id="container" style="margin-top:100px">
<form class="form-horizontal" role="form" style="padding-top: 20px" action ="CreateLoginDB.jsp" method="POST">
  <div class="form-group">
    <label for="inputUsername" class="col-sm-2 control-label">Brugernavn</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="inputUsername" placeholder="Brugernavn" name="User">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-2">
      <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="inputName" class="col-sm-2 control-label">Navn</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="inputName" placeholder="Navn" name="Name">
    </div>
  </div>
    <div class="form-group">
    <label for="inputAddress" class="col-sm-2 control-label">Adresse</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="inputAddress" placeholder="Adresse" name="Address">
    </div>
  </div>
    <div class="form-group">
    <label for="inputTelefone" class="col-sm-2 control-label">Telefon</label>
    <div class="col-sm-2">
      <input type="text" class="form-control" id="inputTelefone" placeholder="Telefon" name="Telefone">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Opret Bruger</button>
    </div>
  </div>
</form>
         </div>
      <!-- <a href="../htmls/Login.html">Go to Login</a> -->
<%@ include file="Footer.jsp" %>