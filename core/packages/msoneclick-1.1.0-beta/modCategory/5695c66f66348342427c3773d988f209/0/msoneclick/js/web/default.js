var msOneClick = {
    options: {
        selector: 'oneClick',
        selectorForm: '.msOnclick_form_id_',
        modal: '',
        body: '',
        footer: '',
        form: '',
        product_id: 0,
        selecto_form: 0,
    }
    ,init: function(sel) {
        selector = '#'+sel;
        msOneClick.hasHash = [];
        var elements = ['modal','body','footer','form'];
        for (var i in elements) {
            if (elements.hasOwnProperty(i)) {
                var elem = elements[i];
                this.options[elem] = selector+'_'+elem;
                if (!this.options[elem].length) {
                    //console.log('Error: could not initialize element "' + elem + '" with selector "' + this.options[elem] + '".');
                }
            }
        }

        var elem = $(selector);

        if (!elem.length) {return false;}
        if(!jQuery().ajaxForm) {
            document.write('<script src="'+ msOneClickConfig.jsUrl +'web/lib/jquery.form.min.js"><\/script>');
        }
        if(!jQuery().jGrowl) {
            document.write('<script src="'+ msOneClickConfig.jsUrl +'web/lib/jquery.jgrowl.min.js"><\/script>');
        }
        if(!jQuery().modal) {
            document.write('<script src="'+ msOneClickConfig.jsUrl +'web/bootstrap/js/bootstrap.min.js"><\/script>');
        }
        if(!jQuery().inputmask) {
            document.write('<script src="'+ msOneClickConfig.jsUrl +'web/lib/jquery.maskedinput.min.js"><\/script>');
        }

        $(document).on('click', selector, function(e) {
            e.preventDefault();
            var product_id = $(this).data('product');
            var hash = $(this).data('hash');


            msOneClick.options.product_id = product_id;
            msOneClick.options.hash = hash;
            $(msOneClick.options.modal).modal('show');
            msOneClick.load();

            return true;
        });


        $( document ).on( 'change keypress', '#product_change', function( event ){
            $(this).submit();
        });

    }

    /* Проверка по одному полю*/
    ,initForm : function(formid) {

        var selector = '#'+formid;

        msOneClick.options.selecto_form = selector;
        $( document ).on( 'change click', selector+' input', function( event ){

            var input = $(this);


            $.ajax({
                type: 'POST'
                ,url: msOneClickConfig.actionUrl
                ,dataType: 'json'
                ,data: {
                    ctx : msOneClickConfig.ctx,
                    pageId : msOneClickConfig.pageId,
                    msc_action : 'form/add',
                    value : input.val(),
                    field : input.attr('name')
                }
                ,cache: false
                ,success: function( response ) {
                    if(response.success) {
                        msOneClick.checkForm(response.data);
                    }
                    else {
                        msOneClick.checkForm(response.data);
                    }

                    msOneClick.resetError(input);
                }

            });


        });

        $(document).on('submit', selector, function(e) {
            e.preventDefault();

            var count = $('#dynamicmodal input[name=count]').val();
            var product_id = $('#dynamicmodal input[name=id]').val();
            var hash = $('#dynamicmodal input[name=hash]').val();

            $(this).ajaxSubmit({
                url: msOneClickConfig.actionUrl,
                dataType: 'json',
                type: 'post',
                data: {
                    ctx : msOneClickConfig.ctx,
                    pageId : msOneClickConfig.pageId,
                    msc_action : 'form/sendform',
                    product_id : product_id,
                    hash : hash,
                    count : count,
                    fast_order : 1,
                },
                beforeSubmit: function(formData, $form) {
                    // Additional check for old version of form
                    var found = false;
                    for (var i in formData) {
                        if (formData.hasOwnProperty(i) && formData[i]['name'] == 'action') {
                            found = true;
                        }
                    }
                    if (!found) {
                        formData.push({name: 'action', value: 'form/sendform'});
                    }
                    // --
                    $form.find('input, button, a').attr('disabled', true);
                    return true;
                },
                success: function(response, status, xhr, $form) {

                    $form.find('input, button, a').attr('disabled', false);
                    if (response.success) {
                        msOneClick.Message.success(response.message);
                        $form.resetForm();
                        $(msOneClick.options.body).html(response.data.body);

                        $(msOneClick.options.modal).on('hidden.bs.modal', function (e) {
                            location.reload();
                        })
                    }
                    else {
                        msOneClick.checkForm(response.data);
                        msOneClick.Message.error(response.message, false);
                    }
                    if (response.data.refresh) {
                        document.location.href = response.data.refresh;
                    }
                }
            });
            return false;
        });


        setTimeout(function() {
            $('input#msoc_city').focus()
        }, 500);


        $( document ).on( 'change keypress', '#dynamicmodal #product_price', function( event ){
            var count = $(this).val();
            var price = $('#dynamicmodal input[name=price]').val();
            if(count < 1){
                $(this).val(1);
            }
            var sum = price * count;
            $('#price_cou').html(sum);
        });

    }
    ,load : function(  ) {
        $(msOneClick.options.body).html('<div class="msoneclick_body_loader"><img src="'+msOneClickConfig.imagesUrl+'web/loader.gif" alt="Загрузка формы"></div>');
        $(msOneClick.options.footer).show();

        this.getform();
    }
    ,getform : function( ) {

        var formData = {};
        var formid = msOneClick.options.selectorForm+msOneClick.options.product_id;

        if($(formid).length == 1){
            var $form = $(formid);
            formData = $form.serializeArray();
        } else {
            var $form = $(miniShop2.form);
            formData = $form.serializeArray();
        }

        console.log(formData);

        $.ajax({
            type: 'POST'
            ,url: msOneClickConfig.actionUrl
            ,dataType: 'json'
            ,data: {
                ctx : msOneClickConfig.ctx,
                pageId : msOneClickConfig.pageId,
                msc_action : 'form/get',
                product_id : msOneClick.options.product_id,
                hash : msOneClick.options.hash,
                optionsform : formData
            }
            ,cache: false
            ,success: function( response ) {

                if(response.success) {
                    $(msOneClick.options.body).html(response.data.form);

                    if (msOneClickConfig.mask_phone == true){
                        $("input[name=phone]").inputmask("mask", {"mask": msOneClickConfig.mask_phone_format}); //specifying fn & options
                    }

                    msOneClick.checkForm(response.data);
                    // Проверка на рабочие версии
                    if($.inArray(msOneClick.options.hash, msOneClick.hasHash) < 0){
                        msOneClick.hasHash.push(msOneClick.options.hash);
                        msOneClick.initForm(response.data.formid);
                    } else {
                        return false;
                    }

                }
                else {
                    msOneClick.Message.error(response.message);
                }
            }

        });
        return false;
    }


    ,setError : function(name,message) {
        tpl = '<div id="msoneclick_form_'+name+'-error" class="invalid errorNotic"><span class="errorBlok">'+message+'</span></div>';
        $('#msoc_'+name).addClass('invalid');
        $('#msoc_'+name).parent().append(tpl);

    }
    ,resetError : function(field) {

        if(field.hasClass('invalid')) {
            field.removeClass("invalid");
            field.parent().find('.errorNotic').remove();
        }
    }
    ,checkForm : function( data ) {

        if(data != undefined) {

            if(data.field != undefined){
                this.resetError($(msOneClick.options.selecto_form+" #msoc_"+data.field));
            } else {
                $( msOneClick.options.selecto_form+" input" ).each(function( index ) {
                    $(this).removeClass("invalid");
                    $(this).parent().find('.errorNotic').remove();
                });
            }

            if(data.errors){
                var errors = data.errors;
                var name = '';
                var message = '';
                var tpl ='';
                for (var i in errors) {
                    name = errors[i]['name'];
                    message = errors[i]['message'];
                    this.setError(name, message);
                }
            }

        }

    }
};

msOneClick.Message = {
    initialize: function() {
        if (typeof $.fn.jGrowl != 'undefined') {
            $.jGrowl.defaults.closerTemplate = '<div>[ ' + msOneClickConfig.close_all_message + ' ]</div>';
            msOneClick.Message.close = function() {
                $.jGrowl('close');
            };

            msOneClick.Message.show = function(message, options) {
                if (!message) return;
                $.jGrowl(message, options);
            }
        }
        else {
            msOneClick.Message.close = function() {};
            msOneClick.Message.show = function(message, options) {
                if (!message) return;
                $.jGrowl(message, options);
                /* if (message) {
                 alert(message);
                 }*/
            };
        }
    }
    ,success: function(message) {
        msOneClick.Message.show(message, {
            theme: 'msoc-message-success',
            sticky: false
        });
    }
    ,error: function(message) {
        msOneClick.Message.show(message, {
            theme: 'msoc-message-error',
            sticky: false
        });
    }
    ,info: function(message) {
        msOneClick.Message.show(message, {
            theme: 'msoc-message-info',
            sticky: false
        });
    }
};
msOneClick.init(msOneClickConfig.selector);
msOneClick.Message.initialize();