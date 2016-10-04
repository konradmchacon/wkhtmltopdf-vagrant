<?php

$graphData = array(
    '0-9' => 0,
    '10-19' => 0,
    '20-29' => 0,
    '30-39' => 0,
    '40-49' => 0,
    '50-59' => 0,
    '60-69' => 0,
    '70-79' => 0,
    '80-89' => 0,
    '90-99' => 0
);
foreach ($tasks as $task) {
    switch (intval($task['duration'] / 10)) {
        case 0:
            $graphData['0-9'] = $graphData['0-9'] + 1;
            break;
        case 1:
            $graphData['10-19'] = $graphData['10-19'] + 1;
            break;
        case 2:
            $graphData['20-29'] = $graphData['20-29'] + 1;
            break;
        case 3:
            $graphData['30-39'] = $graphData['30-39'] + 1;
            break;
        case 4:
            $graphData['40-49'] = $graphData['40-49'] + 1;
            break;
        case 5:
            $graphData['50-59'] = $graphData['50-59'] + 1;
            break;
        case 6:
            $graphData['60-69'] = $graphData['60-69'] + 1;
            break;
        case 7:
            $graphData['70-79'] = $graphData['70-79'] + 1;
            break;
        case 8:
            $graphData['80-89'] = $graphData['80-89'] + 1;
            break;
        case 9:
            $graphData['90-99'] = $graphData['90-99'] + 1;
            break;
    }
}
