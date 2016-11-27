<?php

require_once('lib/PHPMailerAutoload.php');

$mail = new PHPMailer();

$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
$mail->Port = 465;
$mail->CharSet = 'UTF-8';

$body = file_get_contents('mail_text.html');
$mail->Username = 'lexdvis777@gmail.com';
$mail->Password = 'Alex!davis1994';
$mail->setFrom('Alex Davis');
$mail->Subject = 'Mailer php eed';
$mail->MsgHTML($body);
$adress = 'coralowand@yandex.ru';
$mail->AddAddress($adress, 'Eric Rosebrock');


if($mail->send()) {
    echo 'work';
} else {
    echo 'dont work';
}