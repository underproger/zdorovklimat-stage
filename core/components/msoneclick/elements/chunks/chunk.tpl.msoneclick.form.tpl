<form name="formSendCart" id="[[+formid]]" method="post" >

    <div class="forder-popup__goods clearfix">
        <div class="row-fluid" id="msCart">
            <div class="col-xs-12">
                <div class="row msoc_product_line" id="[[+key]]">
                    <div class="col-xs-3 text-center msoc_product_line_image">
                        <img src="[[+thumb]]" />
                    </div>
                    <div class="col-xs-5 msoc_product_line_pagetitle">
                        <h4 class="product-name">[[+pagetitle]]</h4>
                    </div>
                    <div class="col-xs-4 msoc_product_line_count">
                        <div class="product__add-cart ">
                            <div class="text-right">
                                <span class="forder-popup__price"><span id="price_cou">[[+price]]</span> руб.</span>
                            </div>
                            <div class="text-right">
                                <input type="hidden" name="price" value="[[+price]]">
                                <input type="hidden" name="product_id" value="[[+product_id]]">
                                <div class="input-group input-prepend col-md-6 pull-right">
                                    <input type="number" name="count" autocomplete="off" value="[[+count]]" placeholder="0" class="input-sm form-control">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="form-horizontal msoneclick_form">
        <input type="hidden" name="hash" value="[[+hash]]">
        <input type="hidden" name="price" value="[[+price]]">
        <input type="hidden" name="id" value="[[+id]]">

        <div class="forder-popup__block forder-popup__block--grey">
            <div class="form-group">
                <label for="msoc_city" class="col-sm-2 control-label [[+city_required]]">[[%msoc_field_city]]</label>
                <div class="col-sm-10">
                    <input type="text" value="[[!+city:default=``]]" name="city" class="forder-popup__input form-control" id="msoc_city" placeholder="[[%msoc_field_city_ple]]">
                </div>
            </div>
            <div class="form-group">
                <label for="msoc_addr_country" class="col-sm-2 control-label [[+addr_country_required]]">Страна</label>
                <div class="col-sm-10">
                    <input type="text" value="[[!+addr_country:default=``]]" name="addr_country" class="forder-popup__input form-control" id="msoc_addr_country" placeholder="Россия">
                </div>
            </div>
        </div>
        <div class="forder-popup__block forder-popup__block--grey">
            <div class="form-group">
                <label for="msoc_receiver" class="col-sm-2 control-label [[+receiver_required]]">[[%msoc_field_receiver]]</label>
                <div class="col-sm-10">
                    <input type="text" value="[[!+receiver:default=``]]" name="receiver" class="forder-popup__input form-control" id="msoc_receiver" placeholder="[[%msoc_field_receiver_ple]]">
                </div>
            </div>
            <div class="form-group">
                <label for="msoc_phone" class="col-sm-2 control-label [[+receiver_required]]">[[%msoc_field_phone]]</label>
                <div class="col-sm-10">
                    <input type="text" name="phone" value="[[!+phone:default=``]]" autocomplete="off" class="forder-popup__input form-control" id="msoc_phone" placeholder="[[%msoc_field_phone_ple]]">
                </div>
            </div>

            <div class="form-group">
                <label for="msoc_email" class="col-sm-2 control-label [[+receiver_required]]">[[%msoc_field_email]]</label>
                <div class="col-sm-10">
                    <input type="email" name="email" value="[[!+email:default=``]]" class="forder-popup__input form-control" id="msoc_email" placeholder="[[%msoc_field_email_ple]]">
                </div>
            </div>
        </div>

        <div class="forder-popup__block forder-popup__block--grey">
            <div class="form-group">
                <label for="msoc_comment" class="col-sm-2 control-label">[[%msoc_field_comment]]</label>
                <div class="col-sm-10">
                    <textarea autocomplete="off" placeholder="[[%msoc_field_comment_ple]]" id="msoc_comment" name="comment" class="forder-popup__textarea form-control" title="">[[!+comment:default=``]]</textarea>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="submit"  name="msoc_send_from" class="btn btn-success btn-lg">[[%msoc.button]]</button>
            <br><br>
            <p class="text-muted">
                [[%msoc_form_footer_text]]
            </p>
        </div>
    </div>
</form>