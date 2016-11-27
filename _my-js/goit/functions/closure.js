(function() { // сразу выполняется, не загряжняет глобал область видимости.
    var a = 45; // неоступна извне
})(); // параметры


var test = (function (){


    function inner(n) {
        console.log(n);
    }

    return {
        inner: inner
    }
})();

test.inner(2);