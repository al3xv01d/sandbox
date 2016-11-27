"use strict";

(function () {
    // переменная, которая хранит соединение
    var socket;

    ////////////////////////////////////////////////////////////////////////////
    var init = function () { // функция инициализации соединения

        socket = new WebSocket(document.getElementById("sock-addr").value); // получаем ip и порт с формы

        socket.onopen = connectionOpen; // назначанием обработчик соединения
        socket.onmessage = messageReceived; // назначаем обработчик получения сообщения от сервера
        //socket.onerror = errorOccurred;
        //socket.onopen = connectionClosed;

        document.getElementById("sock-send-butt").onclick = function () { // при нажатии кнопки отправить...
            socket.send(document.getElementById("socksg").value); // отправляем сообщение активному серверу
        };

        document.getElementById("sock-disc-butt").onclick = function () { // когда нажал на кнопку отсоединиться...
            connectionClose(); // отсоединился, заметка от кэпа
        };

        document.getElementById("sock-recon-butt").onclick = function () { // при кнопке соединиться...
            socket = new WebSocket(document.getElementById("sock-addr").value); // соединяемся по IP и порту в форме
            socket.onopen = connectionOpen;
            socket.onmessage = messageReceived;
        };

    };

    function connectionOpen() {
        socket.send("Connection with \""+document.getElementById("sock-addr").value+"\" Подключение установлено обоюдно, отлично!"); // при открытии отправляем соединение серверу
    }

    function messageReceived(e) {
        console.log("Ответ сервера: " + e.data);
        document.getElementById("sock-info").innerHTML += (e.data+"<br />"); // добавляем ответ в консоль
    }

    function connectionClose() {
        socket.close();
        document.getElementById("sock-info").innerHTML += "Соединение закрыто <br />"; // добавляем сообщение о закрытии в консоль

    }

    return {
        ////////////////////////////////////////////////////////////////////////////
        // ---- onload event ----
        load : function () {
            window.addEventListener('load', function () {
                init();
            }, false);
        }
    }
})().load(); 