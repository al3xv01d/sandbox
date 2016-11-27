// После загрузки страницы
window.onload = function () {
    // Создаем ссылки на 3 кнопки
    var p = document.getElementById("allP");
    var a = document.getElementById("allA");
    var div = document.getElementById("allDiv");

    // Обработка события клика на каждой из кнопок
    p.onclick = function () {
        var pArr = document.getElementsByTagName("p");
        for (var i = 0; i < pArr.length; i++) {
            pArr[i].style.border = "1px solid green";
        }
    }
    a.onclick = function () {
        var aArr = document.getElementsByTagName("a");
        for (var i = 0; i < aArr.length; i++) {
            aArr[i].style.border = "1px solid green";
        }
    }
    div.onclick = function () {
        var divA = document.getElementById("div_test");
        divA.style.border = "1px solid red";
    }
}
