var counter = 5;



var timer = setInterval(some, 1100);

var some = function () {

    for (var i = 0; i  < counter; i++) {
        if(i === 5) {
            clearTimeout(timer);
        }
        console.log('it works');
    }

};

setTimeout(some, 1100);

//clearTimeout(timer);