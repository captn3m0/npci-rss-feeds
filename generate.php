<?php

$contents = file_get_contents('weneedfeed.yml.tpl');
$c = str_replace('__YEAR__', date('Y'), $contents);
file_put_contents('weneedfeed.yml', $c);