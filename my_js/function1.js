var calc = {
    status: 'test',
    plus: function (a,b) {
        return (
            console.log(this),
                console.log(a+b),
                console.log(arguments),
                 console.log(this.status)
        )

    }

};

calc.plus(2,4);

// objects - constructors

var dog = function() {
    var name;
    var breed;
    var speak = function () {
        console.log(this.name + 'gav gav');
    }
};

firstDog = new dog;
firstDog.name = 'sharik';
firstDog.breed = 'doberman';

secondDog = new dog;
secondDog.name = 'bobik';
secondDog.breed = 'pudel';

// console.log(firstDog.name);
// console.log(secondDog.name);

firstDog.speak();





