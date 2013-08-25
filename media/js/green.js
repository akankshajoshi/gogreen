
$('.cls_keyword').on('click',function(){
    $('#id_hdnkeyword').val($(this).text());
    $('#proxy_form').submit();
 });

$('.cls_tab').on('click',function(){
    var e = $(this);
    e.h = $(this).attr('href').replace('#','');
    $('.cls_homeform').hide();
    $('.cls_tab_'+ e.h).show();
    $('.cls_tab').removeClass('active');
    $(this).addClass('active');
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
        $f.makeRequest(k,function(){

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
    $f.makeRequest(k,function(){

    })
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
        $f.makeRequest(k,function(){

        })
    }
});



    $(document).ready(function(){
        $("#googlemap").each(function(){
            var embed ="<iframe width='100%' height='100%' frameborder='0' scrolling='no'  marginheight='0' marginwidth='0' src='https://maps.google.com/maps?&amp;q="+ encodeURIComponent( $(this).text() ) +"&amp;output=embed'></iframe>";
            $(this).html(embed);
        });
    });
