<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>


<p id="load" style="cursor: pointer">Load data</p>

<div id="info"></div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script>

    function funcBefore () {
        $('#info').text('Waiting data');
    }

    function funcSuccess () {
        $('#info').text(this.data);
    }

    $(function () {
       $('#load').on('click', function () {
           $.ajax( {
               url: 'content.php',
               type: 'POST',
               data: ({
                   name: 'Alex',
                   surname: 'Davis'
               }),
               dataType: 'html',
               beforeSend: funcBefore,
               success: funcSuccess
           });

       });

    });

</script>

</body>
</html>