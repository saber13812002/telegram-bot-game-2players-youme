<?php


require  'db.php';
$sql = new DB ();

$query="SELECT DATE(timestamp) AS ForDate, COUNT(*) AS NumPosts FROM log GROUP BY DATE(timestamp) ORDER BY ForDate";

$sql->query($query);

                
while ( $r = mysqli_fetch_assoc ( $sql->get_result () ) ) {
    // Do something with $value.
echo $r["ForDate"]." - ".$r["NumPosts"].'
'."\n\r";
}
//echo 1;

                
?>