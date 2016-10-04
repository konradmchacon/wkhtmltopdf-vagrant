<?php

$task = strip_tags($_POST['task']);
$date = date('Y-m-d');
$duration = $_POST['duration'];

require("connect.php");

mysqli_query($connection, "INSERT INTO tasks VALUES ('', '$task', '$date', $duration)");

$query = mysqli_query($connection, "SELECT * FROM tasks WHERE task='$task' and date='$date' and duration='$duration'");

while ($row = mysqli_fetch_assoc($query)) {
    $task_id = $row['id'];
    $task_name = $row['task'];
    $task_duration = $row['duration'];
}

mysqli_close($connection);
echo '<li><div class="duration"> ' . $task_duration . 'h</div><span>' . $task_name . '</span><img id="' . $task_id . '" class="delete-button" width="10px" src="images/close.svg" /></li>';
?>