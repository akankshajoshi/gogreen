django.jQuery(document).ready(function() {
	django.jQuery('#event_set-group').hide();
	django.jQuery('#article_set-group').hide();
	django.jQuery('#picsvideo_set-group').hide();
	django.jQuery('#storyquotes_set-group').hide();
	django.jQuery('#storyquotes_set-group').hide();
	django.jQuery('#questionire_set-group').hide();
        if (django.jQuery('#id_type').val() == 1){
           django.jQuery('#event_set-group').show();
           django.jQuery('#article_set-group,#picsvideo_set-group,#storyquotes_set-group,#questionire_set-group').hide();

    }
    else if (django.jQuery('#id_vichar_type').val() == 2){
           django.jQuery('#article_set-group').show();
           django.jQuery('#event_set-group,#picsvideo_set-group,#storyquotes_set-group,#questionire_set-group').hide();
    }
    else if (django.jQuery('#id_vichar_type').val() == 3){
           django.jQuery('#picsvideo_set-group').show();
           django.jQuery('#event_set-group,#article_set-group,#storyquotes_set-group,#questionire_set-group').hide();
    }
    else if (django.jQuery('#id_vichar_type').val() == 4){
           django.jQuery('#storyquotes_set-group').show();
           django.jQuery('#event_set-group,#article_set-group,#picsvideo_set-group,#questionire_set-group').hide();
    }
    else if (django.jQuery('#id_vichar_type').val() == 5){
           django.jQuery('#questionire_set-group').show();
           django.jQuery('#event_set-group,#article_set-group,#storyquotes_set-group,#picsvideo_set-group').hide();
    }
        if (django.jQuery(this).val() == 1){
            django.jQuery('.form-row pic').show();
            django.jQuery('form-row video').hide();
     }
    	else if (django.jQuery(this).val() == 2){
            django.jQuery('.form-row pic').hide();
            django.jQuery('form-row video').show();
     }

    django.jQuery('#id_vichar_type').trigger('change');
    django.jQuery('#id_picsvideo_set-0-type').trigger('change');
});

django.jQuery('#id_vichar_type').live('change',function(){
    if (django.jQuery(this).val() == 1){
           django.jQuery('#event_set-group').show();
           django.jQuery('#article_set-group,#picsvideo_set-group,#storyquotes_set-group,#questionire_set-group').hide();

    }
    else if (django.jQuery(this).val() == 2){
           django.jQuery('#article_set-group').show();
           django.jQuery('#event_set-group,#picsvideo_set-group,#storyquotes_set-group,#questionire_set-group').hide();
    }
    else if (django.jQuery(this).val() == 3){
           django.jQuery('#picsvideo_set-group').show();
           django.jQuery('#event_set-group,#article_set-group,#storyquotes_set-group,#questionire_set-group').hide();
    }
    else if (django.jQuery(this).val() == 4){
           django.jQuery('#storyquotes_set-group').show();
           django.jQuery('#event_set-group,#article_set-group,#picsvideo_set-group,#questionire_set-group').hide();
    }
    else if (django.jQuery(this).val() == 5){
           django.jQuery('#questionire_set-group').show();
           django.jQuery('#event_set-group,#article_set-group,#storyquotes_set-group,#picsvideo_set-group').hide();
    }

});

django.jQuery('#id_picsvideo_set-0-type').live('change',function(){
	if (django.jQuery(this).val() == 1){
        django.jQuery('.pic').show();
        django.jQuery('.links').hide();
 }
	else if (django.jQuery(this).val() == 2){
        django.jQuery('.pic').hide();
        django.jQuery('.links').show();
 }else{
        django.jQuery('.pic').hide();
        django.jQuery('.links').hide();
        django.jQuery('.title').hide();
    }
});