$('.cls_keyword').on('click',function(){
    $('#id_hdnkeyword').val($(this).text());
    var k = $(this).text().replace(/[^\w]/gi, '-')
    $('#proxy_form').attr('action',$('#proxy_form').attr('action')+k+'/');
    $('#proxy_form').submit();
});


$('#frmsearch').on('submit',function(){
    var k = $('input[name=keyword]').val().replace(/[^\w]/gi, '-')
    $(this).attr('action',$(this).attr('action')+k+'/');
    return true;
});

$('.cls_homeform').on('submit',function(){
    var k = $(this).find('input[name=keyword]').val().replace(/[^\w]/gi, '-')
    $(this).attr('action',$(this).attr('action')+k+'/');
    return true;
});


$('.cls_tab').on('click',function(){
    var e = $(this);
    e.h = $(this).attr('href').replace('#','');
    $('.cls_homeform').hide();
    $('.cls_tab_'+ e.h).show();
    $('.cls_tab').removeClass('active');
    $(this).addClass('active');
    $('.cls_type').val(e.data('type'));
});

$('input.numericOnly').bind('keypress', function(e) {
    return ( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57)) ? false : true ;
})

$('#id_enquiry').validate({
    onfocusout:function(element){
        $(element).valid();
    },
    submitHandler:function(form)
    {
        var k = {};
        k.DATA = $(form).serialize();
        k.SRC = $(form).attr('action');
        $('.cls_dyn_popup').remove();
        $f.makeRequest(k,function(){
            k.div = $('<div class="cls_dyn_popup" title="Enquiry"></div>');
            k.open = function(){
                $('.cls_dyn_popup').html('Successfully');
            }
            $f.popup(k);
        })
    }
});

$('#id_formcontact').validate({
onfocusout:function(element){
    $(element).valid();
},
submitHandler:function(form)
{
    var k = {};
    k.DATA = $(form).serialize();
    k.SRC = $(form).attr('action');
    $('.cls_dyn_popup').remove();
    $f.makeRequest(k,function(){
        k.div = $('<div class="cls_dyn_popup" title="Contact Us"></div>');
        k.open = function(){
            $('.cls_dyn_popup').html('Your information has been successfully updated.');
        }
        $f.popup(k);
    });
}
});

$('#id_formreview').validate({
    onfocusout:function(element){
        $(element).valid();
    },
    submitHandler:function(form)
    {
        var k = {};
        k.DATA = $(form).serialize();
        k.SRC = $(form).attr('action');
        $('.cls_dyn_popup').remove();
        $f.makeRequest(k,function(){
            k.div = $('<div class="cls_dyn_popup" title="Review"></div>');
            k.open = function(){
                $('.cls_dyn_popup').html('Successfully');
            }
            $f.popup(k);
        })
    }
});


$('.lmr').live('click',function(){
    var k ={};
    k.DATA=$('#frm_search').serialize();
    k.SRC = sc.url_prefix+"search/?page="+$(this).data('id');
    $f.makeRequest(k,function(r){
        $('#content').find('.lmr').remove();
        $('#searchresult').append(r.HTML)

    });
});

$('.cls_categ').on('click',function(){
    var k = $(this);
    $('.cls_subcateg').slideUp('slow');
        $('#sub_'+k.attr('id')).slideDown('slow',function(){
     });
});

    $(document).ready(function(){
        $("#googlemap").each(function(){
            var embed ="<iframe width='100%' height='100%' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='https://maps.google.co.in/maps?q=" + $(this).text()+"&hl=en&oq="+$(this).text()+"&t=m&z=&amp;output=embed'></iframe>";
            $(this).html(embed);
        });
    });



$(".cls_comp").autocomplete({
        source: function (request, response) {
            $.ajax ({
                url: sc.url_prefix+"query/",
                data: { 'city':$('#id_city').val(),'terms':request.term,'search_by':$('.cls_type:checked').val() },
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset = utf-8",
                success: function (data) {
                    response (data.result);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }

            });
        },
    minLength: 1,
    open: function() { $(this).autocomplete("widget").css({"width": $(this).width()+6})},
    /*appendTo:$( ".cls_comp").parent(),*/
    select: function( event, ui ) { }

});

$('.cls_type').on('change',function(){
    act_deac_autocomp();
})

$(function(){
    //act_deac_autocomp();
})

function act_deac_autocomp(){
    /*if($('.cls_type').length>0){
        $('.cls_type:checked').val() == 'by_name' ? $(".cls_comp").autocomplete( "enable" ) : $(".cls_comp").autocomplete( "disable");
    }*/
}