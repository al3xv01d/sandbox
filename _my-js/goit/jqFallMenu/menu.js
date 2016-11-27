;(function () {


    $(function () {
        var $links = $('.menu a');

        $links.on('click', function (e) {
            e.preventDefault();
            var $submenu = $(this).siblings('.submenu');
            console.log('sub ', $submenu);
            $submenu.slideToggle();

        })
    });


})();