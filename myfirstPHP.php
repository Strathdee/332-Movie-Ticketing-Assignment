<!DOCTYPE html>
<html>
<head>
<link href="firstPage.css" type="text/css" rel="stylesheet" >
</head>
<body>
<h2>Employee Information</h2>
<table>
<tr><th>Project Name</th><th>Location</th></tr>

<?php
$givenName = $_POST["firstname"];                      
$surname = $_POST["lastname"];
$dno = $_POST["deptnum"];
echo "<h3>Hello $givenName $surname</h3>";
echo "<p>I see you are in department $dno.  Here is a list of the department's projects and locations.</p>";

#run a query to get the project names and locations of the person's department.
$dbh = new PDO('mysql:host=localhost;dbname=companyDB', "root", "");
#user name and password for mysql when using XAMPP is "root" and a blank password
$rows = $dbh->query("select pname, plocation from project where dnum = $dno");
foreach($rows as $row) {
		echo "<tr><td>".$row[0]."</td><td>".$row[1]."</td></tr>";
    }
    $dbh = null;

?>

</table>


 </body>
</html>



