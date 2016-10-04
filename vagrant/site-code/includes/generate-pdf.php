<?php
$url = strip_tags($_POST['url']);
$filename = "report-".uniqid().".pdf";
$wkhtmltopdfCommand="/usr/local/bin/wkhtmltopdf --print-media-type ".$url." /var/www/html/site-code/pdfs/".$filename;
exec($wkhtmltopdfCommand);
echo '/site-code/pdfs/'.$filename;
?>
