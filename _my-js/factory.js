var obj1 = {
    name: 'Alex',
    greets: function (name) {
        return 'Hello ' + name;
    }
};

//////////********* FACTORY

function createPerson(name, lastName) {

    var person = {
        name: name,
        lastName: lastName,
        greet: function (name) {
            return 'Hello ' + name;
        }
    };

}

var obj2 = createPerson('Alex', 'Vodi');