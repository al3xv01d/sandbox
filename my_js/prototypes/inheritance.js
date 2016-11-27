
var classAAA = function () {
    this.name = 'name';
};

var classBBB = function () {
    this.last_name = 'last_name';
};

classBBB.prototype = classAAA;
alert(classBBB.name);