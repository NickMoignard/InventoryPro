$(document).ready(function(){

    $('#bulk-update-btn').on('click', function(){
        console.log('jquery engaged');
        $(this).hide();

        // START SPINNER
        alert('updating inventory levels!');
        var variant_ids = $('.input-variant-id').map(function() {
            return $(this).html();
        }).get();

        var variant_quantities = $('.input-quantity').map(function() {
            return $(this).find('input').val();
        }).get();

        $.ajax({
            type: "PUT",
            url: "variants/bulk_update",
            data: {
                variants: { ids: variant_ids, quantities: variant_quantities }
            },
            dataType: "json"
        }).done(function(data){
            console.log("updated variants successfully!");
            // STOP SPINNER
        }).fail(function(){
            console.log("something went wrong!!")
            // STOP SPINNER
        });
    });
});