<?php

$file = fopen('data.csv', 'rt');

for($i=0; $data = fgetcsv($file, 1000, ','); $i++) {
    $num = count($data);

    echo '<h3> Num of fiels =  '.$i.' field = ' .$num;

    for($j=0; $j < $num; $j++) {
        echo $j .' '. $data[$j].'<br>';
    }
}

fclose($file);


// insert dat into csv file

$arr = [
  'fdf,ret,545',
    'fdf,ret,545',
    '22fdf,r3et,5435',
];

$insert = fopen('data.csv', 'w');

foreach ($arr as $item) {

    fputcsv($insert, explode(',', $item), ',');

}

fclose($insert);