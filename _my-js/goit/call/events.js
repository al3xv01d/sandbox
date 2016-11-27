//calculate.call


function calculate(a,b) {

    console.log('i am ' + this.firstName + ' ' + this.lastName + ' ' + (+a + +b) + ' dolars');
}

context = {
    firstName: 'Alex',
    lastName: 'Davis'
};

calculate.call(context, 4,6);

calculate.apply(context, [4,6]);

function printArguments() {
    var args = [].slice.call(arguments);  // это псевдомассив
    console.log(args);
}