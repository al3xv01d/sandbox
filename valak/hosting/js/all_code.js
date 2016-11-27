$(function() {

    $("#js_start").text("text");
    // $("#js_nav > a").text("text");
    $("#js_nav > a:first-child").text("text");

});
//////////////////////////////////////////////////////////////
$("#js_start").on('click', function () {
    $(this).text('test')
});

///// Delete stantart behavior

$("#js_start").on('click', function (event) {
    event.preventDefault();
    $(this).text('test')
});

//// Scroll animate 

var plans_offset = $('#js_plans').offset().top;  // here is offset from top - >1000 px

$('html, body').animate({ // here is the object 
    scrollTop: plans_offset

}, 500); // time to scroll in miliseconds