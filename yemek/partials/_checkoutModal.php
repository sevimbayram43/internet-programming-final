<!-- Checkout Modal -->
<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="checkoutModal">Bigilerinizi Giriniz:</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form action="partials/_manageCart.php" method="post">
                <div class="form-group">
                    <b><label for="address">Adres:</label></b>
                    <input class="form-control" id="address" name="address" placeholder="mah. cd. vb" type="text" required minlength="3" maxlength="500">
                </div>
               
                <div class="form-row">
                    <div class="form-group col-md-6 mb-0">
                        <b><label for="phone">Telefon Numarası:</label></b>
                        <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon">+90</span>
                        </div>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="xxxxxxxxxx" required pattern="[0-9]{10}" maxlength="10">
                        </div>
                    </div>
                  
                </div>
                <div class="form-group">
                    <b><label for="password">Şifre:</label></b>    
                    <input class="form-control" id="password" name="password" placeholder="Şifre Giriniz" type="password" required minlength="4" maxlength="21" >
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">İptal</button>
                    <input type="hidden" name="amount" value="<?php echo $totalPrice ?>">
                    <button type="submit" name="checkout" class="btn btn-success">Sipariş</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>