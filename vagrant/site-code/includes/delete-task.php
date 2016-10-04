<?php

$task_id = strip_tags($_POST['task_id']);

require("connect.php");

mysqli_query($connection, "DELETE FROM tasks WHERE id='$task_id'");
mysqli_close($connection);
?>