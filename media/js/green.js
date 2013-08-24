
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
