
$('.cls_keyword').on('click',function(){
    $('#id_hdnkeyword').val($(this).attr('text'));
    $('#proxy_form').submit();
 });
