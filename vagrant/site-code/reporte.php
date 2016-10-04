<!DOCTYPE HTML>
<html>
    <head>
        <title>Simple To-Do List</title>
        <link rel="stylesheet" href="./style.css" type='text/css' >
		      <link rel="stylesheet" href="./print.css" type='text/css'>
    </head>
    <body>
        <div class="wrap report">
            <div class="task-list">
                <a href="javascript:void(0);" class="btn generate-report hide-print">Descargar</a>

                <?php
                require("includes/connect.php");

                $query = mysqli_query($connection, "SELECT * FROM tasks ORDER BY date ASC");
                $numrows = mysqli_num_rows($query);

                $tasks = array();
                if ($numrows > 0) {
                    while ($row = mysqli_fetch_assoc($query)) {
                        $tasks[] = array(
                            'id' => $row['id'],
                            'task' => $row['task'],
                            'duration' => $row['duration'],
                        );
                    }
                }
                ?>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Titulo</th>
                            <th>Duracion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tasks as $task) { ?>
                            <tr>
                                <td><?php echo $task['id'] ?></td>
                                <td><?php echo $task['task'] ?></td>
                                <td><?php echo $task['duration'] ?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <?php require("includes/load-grafico-data.php"); ?>
                <div id="grafico">

                </div>
            </div>
        </div><!-- #wrap -->
    </body>
    <!-- JavaScript Files Go Here -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script>
        $(function () {

			$(".generate-report").click(function(){
        var tagetUrl='http://localhost/site-code/reporte.php';
        $.post('includes/generate-pdf.php', {url: tagetUrl}, function (data) {
          var anchor = document.createElement('a');
          anchor.href = data;
          anchor.target = '_blank';
          anchor.download = 'reporte.pdf';
          anchor.click();
        });

			});

			Highcharts.setOptions({
				plotOptions: {
				series: {
					animation: false
					     }
				}
			});
            $('#grafico').highcharts({
                chart: {
                    type: 'bar',
                    animation: false
                },
				 line: {
					animation: false
				},
                title: {
                    text: 'Carga tareas en horas'
                },
                xAxis: {
<?php $columnsName = array_keys($graphData); ?>
                    categories: ['<?php echo implode("','", $columnsName); ?>'],
                },
                yAxis: {
                    title: {
                        text: 'Cantidad Tareas'
                    },
                    tickInterval: 1
                },
                series: [{
                        name: 'Cantidades',
                        data: [<?php echo implode(",", $graphData); ?>]
                    }],
            });
        });

    </script>

</html>
