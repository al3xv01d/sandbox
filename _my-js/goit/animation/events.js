function slideLeft(el) {
    var leftPosition = 0;
    var time = 0;


var interval = setInterval(function () {

        if(time > 10000) {
            clearInterval(interval);
        }

        time += 50;
        leftPosition += 1;
        el.style.left = leftPosition + 'px';
    console.log(el.style.left);
    }, 1);
}




var box = document.querySelector('.box');


box.addEventListener('click', function () {
    slideLeft(box);
});