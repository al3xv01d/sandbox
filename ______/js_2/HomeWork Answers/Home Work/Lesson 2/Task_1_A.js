// Вариант с модулем
var Module = {};
// Свойство для проверки дочерних элементов
Module.childs = 0;
// Функция для изменения свойства innerHTML всех дочерних элементов на странице
Module.changeAll = function () {

    var arr=document.body.childNodes;

    for(var i = 0; i < arr.length;i++){
        if(arr[i].nodeType == 1){
            arr[i].innerHTML = "PARAGRAPH";
            Module.childs++;
        }
    }
    alert(Module.childs);
}