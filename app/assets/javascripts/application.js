// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .


$(function(){
    console.log('jquery engaged');
    $("#products th, #products .pagination").on("click", 'a',function(){
        $.getScript(this.href);
        return false;
    });


    // $('#products_search').keyup(function(){
    //     console.log('key up');
    //     $.get($('#products_submit').attr('action'), $("#products_submit input").serialize , null, "script");
    //     return false
    // });
});