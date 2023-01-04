  <!-- Sign up Modal -->
    <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header" style="background-color: rgb(111 202 203);">
            <h5 class="modal-title" id="signupModal">Kaydet</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="partials/_handleSignup.php" method="post">
              <div class="form-group">
                  <b><label for="username">KullanıcıAdı</label></b>
                  <input class="form-control" id="username" name="username" placeholder="" type="text" required minlength="3" maxlength="11">
              </div>
              <div class="form-row">
                <div class="form-group col-md-6">
                  <b><label for="firstName">Ad:</label></b>
                  <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" required>
                </div>
                <div class="form-group col-md-6">
                  <b><label for="lastName">Soyad:</label></b>
                  <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" required>
                </div>
              </div>
              <div class="form-group">
                  <b><label for="email">Email:</label></b>
                  <input type="email" class="form-control" id="email" name="email" placeholder="" required>
              </div>
              <div class="form-group">
                <b><label for="phone">Telefon Numarası:</label></b>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon">+90</span>
                  </div>
                  <input type="tel" class="form-control" id="phone" name="phone" placeholder="" required pattern="[0-9]{10}" maxlength="10">
                </div>
              </div>
              <div class="text-left my-2">
                  <b><label for="password">Şifre:</label></b>
                  <input class="form-control" id="password" name="password" placeholder="" type="password" required data-toggle="password" minlength="4" maxlength="21">
              </div>
              <div class="text-left my-2">
                  <b><label for="password1">Şifreyi Girin:</label></b>
                  <input class="form-control" id="cpassword" name="cpassword" placeholder="" type="password" required data-toggle="password" minlength="4" maxlength="21">
              </div>
              <button type="submit" class="btn btn-success">kaydol</button>
            </form>
            <p class="mb-0 mt-1">Zaten Hesabınız Var <a href="#" data-dismiss="modal" data-toggle="" data-target="#loginModal">Giriş Yapın</a>.</p>
          </div>
        </div>
      </div>
    </div>
