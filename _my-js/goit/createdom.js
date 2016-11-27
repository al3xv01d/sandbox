var div = document.createElement('div');
div.classList.add('box');
div.innerHTML = 'dynamic created div';

var parent = document.querySelector('.parent');
console.log(parent);
parent.appendChild(div);

parent.insertBefore(div, parent.children[0]);

///**********
del = parent.querySelector('p');
console.log(del);
parent.removeChild(del);
//parent.replaceChild();

//////////***********

