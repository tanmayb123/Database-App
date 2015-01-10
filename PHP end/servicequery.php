<?php
$host = "localhost"; //database host server
$db = "testdatabaseswift"; //database name
$user = "Tanmay_Bakshi"; //database user
$pass = "tanmayb123"; //password

$connection = mysql_connect($host, $user, $pass);

//Check to see if we can connect to the server
if(!$connection)
{
    die("Database server connection failed.");  
}
else
{
    //Attempt to select the database
    $dbconnect = mysql_select_db("Friends", $connection);

    //Check to see if we could select the database
    if(!$dbconnect)
    {
        die("Unable to connect to the specified database!");
    }
    else
    {
        $query = "INSERT INTO `Friends`.`friend` (`Name`, `Additional Info`) VALUES ('" . $_GET['x'] . "', '" . $_GET['y'] . "');";
        $resultset = mysql_query($query, $connection);

        echo "Successfully added ";
        echo $query;

    }


}


?>