<!DoCTYPE html>
<html lang='ru'>
<head>
    <title>~cnonb30Balil'le MeTo~a load()</title>
    <meta charset='utf-8'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">

        $(function()  {
        $("#id") .on("click", function() {
            $('#ppp').load("time.php");
        } );
        });
    </script>
</head>
<body>
<div><a href='#' id='id'>Get time</a></div>
<div id='info'></div>
<h1>dd</h1>
<p id="ppp"></p>
</body>
</html>