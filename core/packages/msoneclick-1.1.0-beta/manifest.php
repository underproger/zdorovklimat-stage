<?php return array (
  'manifest-version' => '1.1',
  'manifest-attributes' => 
  array (
    'changelog' => '1.1.0 beta-0
==============
- Добавлена возможность передачи выбранных опций и количества в модельное окно с последующим добавление к заказу

1.0.9 beta-0
==============
- земана чанка с модельным окном

1.0.8 beta-0
==============
- исправлен баг связаный с action

1.0.7 beta-0
==============
- исправлена проверка переменных

1.0.5 beta-0
==============
- проверка ответа в JSON формате

1.0.3 beta-0
==============
- Возвращает состояние корзины на момент отправки
- Исправлены плейсхолдеры для обязательных поле в форме

1.0.2 beta-0
==============
- Исправлена ошибка с дублями сообщений об ошибках

1.0.1 beta-0
==============
- Метод MS отправка заказа в minishop2
- Метод MAIL отправка заказа на email',
    'readme' => '--------------------
msOneClick - Отправка заказа через модельное окно в minishop2 или на email
--------------------
Author: Andrey Stepanenko <bustep.ru@yandex.ru>
--------------------
',
    'chunks' => 
    array (
      'tpl.msOneClick.btn' => '<a href="[[~[[+id]]]]#[[+selector]]" id="[[+selector]]" class="btn_one_click" data-hash="[[+hash]]" data-product="[[+id]]">[[%msoc_btn_one_click]]</a>',
      'tpl.msOneClick.form' => '<form name="formSendCart" id="[[+formid]]" method="post" >

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
</form>',
      'tpl.msOneClick.modal' => '<div id="[[+selector]]_modal" class="modal fade msoneclick_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">[[%msoc]]</h4>
            </div>
            <div class="modal-body" id="[[+selector]]_body"></div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->',
      'tpl.msOneClick.MS.send' => '<div class="forder-popup__block text-center msoneclickSuccess">
    <h1>[[%msoc_form_send_h1]]</h1>
    <p>[[%msoc_form_send_text]]</p>
    <h2><p>[[%msoc_form_send_num]]</p>
        <span class="label label-default">[[+num]]</span>
    </h2>
    <br>
    <button type="button" class="btn btn-default" data-dismiss="modal">[[%msoc_close_modal]]</button>
</div>',
      'tpl.msoneclick.MAIL.send' => '<div class="forder-popup__block text-center msoneclickSuccess">
    <h1>[[%msoc_form_send_h1]]</h1>
    <p>[[%msoc_form_send_text]]</p>
    <br>
    <button type="button" class="btn btn-default" data-dismiss="modal">[[%msoc_close_modal]]</button>
</div>',
      'tpl.msoneclick.email.message' => '[[+subject:is=`1`:then=`Быстрый заказ на сайте`]]
[[+body:is=`1`:then=`
Был оформлен быстрый заказ на сайте: <br><br>
    Товар: <a href="[[+siteUrl]]/index.php?id=4[[+product_id]]"></a>[[+pagetitle]]<br>
    Стоимость: [[+price]]<br>
    Количество товаров: [[+count]]<br>
    ФИО: [[+receiver]]<br>
    Телефон: [[+phone]]<br>
    E-mail: [[+email]]<br>
    Город: [[+city]]<br>
`]]',
    ),
    'setup-options' => 'msoneclick-1.1.0-beta/setup-options.php',
  ),
  'manifest-vehicles' => 
  array (
    0 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modNamespace',
      'guid' => '8d06dc30b12fbde77a5161c9ca33ea7f',
      'native_key' => 'msoneclick',
      'filename' => 'modNamespace/7281bbcc055aac33f12372669aeab3e7.vehicle',
      'namespace' => 'msoneclick',
    ),
    1 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '7661c1a493d3662329c2ca170965c741',
      'native_key' => 'msoneclick_required_fields',
      'filename' => 'modSystemSetting/8943cf2b60e7f38977c42c16462a488c.vehicle',
      'namespace' => 'msoneclick',
    ),
    2 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'b6f1d5c168fec3b0db6b85b6eac5a5d7',
      'native_key' => 'msoneclick_payments',
      'filename' => 'modSystemSetting/340c18c759fb8f9c49321860ad33c0f5.vehicle',
      'namespace' => 'msoneclick',
    ),
    3 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'fd2fdb74ae2c522d814de9ee6fd81588',
      'native_key' => 'msoneclick_deliverys',
      'filename' => 'modSystemSetting/fce4fa42ff4ab2fde3b27fc6e8c476ce.vehicle',
      'namespace' => 'msoneclick',
    ),
    4 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '5c61d6b6853f35300859e40c1f618d5c',
      'native_key' => 'msoneclick_frontend_css',
      'filename' => 'modSystemSetting/96253170ae2fb5f619f92a04fbebc07f.vehicle',
      'namespace' => 'msoneclick',
    ),
    5 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'f8f14816183acf716d689c51dcc6a6ea',
      'native_key' => 'msoneclick_frontend_js',
      'filename' => 'modSystemSetting/bf6d1d011d6d97080ec732d9b00f6fbb.vehicle',
      'namespace' => 'msoneclick',
    ),
    6 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => 'de9cb1a30c35e95083b3f4ad652a6503',
      'native_key' => 'msoneclick_mask_phone',
      'filename' => 'modSystemSetting/c03d17cb309cab0ffc1bb9479b8ddf6a.vehicle',
      'namespace' => 'msoneclick',
    ),
    7 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modSystemSetting',
      'guid' => '131a23da1d3ffd3f966e5c31e4263de9',
      'native_key' => 'msoneclick_mask_phone_format',
      'filename' => 'modSystemSetting/e86c42033bfc4075968e12f4fc7b6ce5.vehicle',
      'namespace' => 'msoneclick',
    ),
    8 => 
    array (
      'vehicle_package' => 'transport',
      'vehicle_class' => 'xPDOObjectVehicle',
      'class' => 'modCategory',
      'guid' => '8ad04728b64e2b318d6ba9bb1a35edef',
      'native_key' => NULL,
      'filename' => 'modCategory/5695c66f66348342427c3773d988f209.vehicle',
      'namespace' => 'msoneclick',
    ),
  ),
);