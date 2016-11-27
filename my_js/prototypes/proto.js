var Animal21 = function($name, $name2) {
    this.dog = $name; // переменные класса или прототипа. класс == протоптип
    this.cat = $name2;
};

/////////////////////////////

var Animal = function() {

    var penguin = 'shkiper'; // приватное свойство прототипа

    var method_private = function() { // приватный метод прототипа или класса
        alert(this.cat); // error
    }


    //публичные свойства прототипа
    this.dog = "some name"; // переменные класса или прототипа. класс == протоптип
    this.cat = 'name';

    this.method = function() { // публичный метод прототипа или класса
        alert(this.dog);
        alert(penguin); // выводим  приватное свойство
        method_private();
    }
};

var zoo = new Animal(); // created object

alert(zoo.dog);
zoo.dog = 'new name';
alert(zoo.penguin); // undefined


Animal.prototype.new_method = function() { // prototype это ссылка на объект. расширяем базовый класс.

};

// Second way for creating objects

var animal = {
    name: 'lolo',
    sum : function(x) {
        return x+x;
    }
};

animal.sum(2);