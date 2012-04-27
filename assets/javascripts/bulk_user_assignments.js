Event.observe(window, 'load', function() {

    $$('.toggle-link').each(function(element){
        element.observe('click', function(event){
            event.element().up('div').select('input').each(function(checkbox){
                checkbox.checked = true;
            });
            event.stop();
        });
    });

});
