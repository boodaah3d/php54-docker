<?php

$db_host = 'mysql';
$db_name = 'example';
$db_user = 'db_user';
$db_pass = 'secret';

$db = mysql_connect($db_host, $db_user, $db_pass);

if (!$db) {
    die('Connection failed: ' . $db->connect_error);
} else {
    echo 'Database connected.';
}

mysql_select_db($db_name, $db);

$result = mysql_query("SELECT * FROM users");

if (mysql_num_rows($result)) {
    echo "<br><br>Users";
    while ($row = mysql_fetch_assoc($result)) {
        echo "<br>id: {$row['id']} -- name: {$row['name']}";
    }
} else {
    echo '<br>No results.';
}
