$(function() {

    /* smooth scroll to plans block
     *********************************/

    $("#js_start").on('click', function (event) {

        event.preventDefault();

        var plans_offset = $('#js_plans').offset().top;  // here is offset from top - >1000 px

        $('html, body').animate({ // here is the object
            scrollTop: plans_offset

        }, 500); // time to scroll in miliseconds
    });

    /* Fixed top menu while scroll
     *********************************/

    var headerH = $('#js_header').height();
    var navH = $('js_nav_container').innerHeight();

    $(document).on('scroll', function () {

        var scroll = $(this).scrollTop();

        if (scroll > headerH) {
            // $('#js_nav_container').addClass('fixed');
            $('#js_nav_container').css({
                position: 'fixed',
                top: 0,
                right: 0,
                left: 0,
                zIndex: 200,
                backgroundColor: '#2c3039'
            });

            $('#js_header').css('paddingTop', navH);
        } else {
            $('#js_nav_container').removeClass('fixed');
            // $('#js_header').removeClass('fixed');

            $('#js_header').removeAttr('style');

        }

    });

    /****************************************
     Smooth scroll for every top menu element
     *********************************************/
    $("#js_nav a").on('click', function (event) {

        event.preventDefault();

        var currentBlock = $(this).attr('href');
        var currentBlockOffset = $(currentBlock).offset().top;

        $('html, body').animate({ // here is the object
            scrollTop: currentBlockOffset - 50

        }, 500);
    });

    /****************************************
     Modals
     *********************************************/

    $('.js_show_modal').on('click', function () {
        event.preventDefault();

        var currentModal = $(this).attr('href');

        $(currentModal + ", js_overlay").fadeIn(500); // speed
        $('body').addClass('open_modal');
        
    });

    $('.js_model_close').on('click', function () {
        event.preventDefault();
        $('.js_modal, #js_overlay').fadeOut(100);
    });






});




