<html>
<head>
<title>Login</title>
</head>
<body>
<a href="home.jsp" id="home">Go To Home</a>
<?php
$host="localhost";
$port=3306;
$socket="";
$user="root";
$password="";
$dbname="empresa";

$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
	or die ('Could not connect to the database server' . mysqli_connect_error());

$query = "SELECT id,nombre FROM articulos";
if ($stmt = $con->prepare($query)) {
	$stmt->execute();
	$stmt->bind_result($Id, $Nombre);
	while ($stmt->fetch()) {
		printf("%s, %s\n", $Id, $Nombre);
	}
        $stmt->close();
	$con->close();
?>										            }
</body>
</html>
