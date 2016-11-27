function func() {
    alert('ddd');
}

var a = document.querySelector('#dom');

// a.onclick = function () {
//     alert('hello');
// };

a.addEventListener('mouseover', function () {
    alert('addEventListener') ;
});
//////////////


function handler() {
    alert('handler') ;
}
a.addEventListener('click', handler);

a.removeEventListener('mouseover', handler);

//******** IE


function addEvent(el, event, callback) {
    if(window.attachEvent) { // ie 8
        el.attachEvent('on' + event, callback)
    } else {
        el.addEventListener(event, callback);
    }
}

/////***************** HNDLER

function handler2(event) {
    alert(event.keyCode) ;
    //event.target

    event.preventDefault();

    event.
}