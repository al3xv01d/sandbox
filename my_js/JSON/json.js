/**
 * Created by User on 05.10.2016.
 */

var data = {
    "name" : "name",

    "age" : 22,

    "bool" : true,

    "array" : [
        "value",
        "value2"
    ],

    "object" : {
        "key" : "value"
    }

};

console.log(data["name"]);

console.log(data.array[1]);

data.array.splice(1,1); // для удаления объектов из массива

var html = '';

for( key in data.object) {
    if(data.object.hasOwnProperty(key)) {
        html += '<li>' +
                '<a href="' +data.object[key] +
                '">' + key + "</a>" + '</li>';
    }
}











