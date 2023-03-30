<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Animal Details Table</title>
	</head>	
	<body>
		<h4>Query: Select id, animalName, name, breed, gender, picture, address, weight from animaldetails; </h4>
		<table border="1">		
			<tr>
				<td><h2>ID</h2></td>
				<td><h2>Name</h2></td>
				<td><h2>Animal Name</h2></td>
				<td><h2>breed</h2></td>
				<td><h2>gender</h2></td>
				<td><h2>picture</h2></td>
				<td><h2>address</h2></td>
				<td><h2>weight</h2></td>				
			</tr>
			<?php			
				include('dbConfig.php');
				echo "Host: ".$host." Database: ".$database. " user: ".$username." password: ".$password ;							
				//Set connection to UTF-8
				mysqli_query($db,"SET NAMES utf8");
				
				//Select data
				$query = "Select id, name,animalName, breed, gender, picture, address, weight from animaldetails;";
				
				$result = mysqli_query($db,$query) or die("Bad Query.");
				mysqli_close($db);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['id'] . "</h2></td>";
					echo "<td><h2>" .$row['name'] . "</h2></td>";
					echo "<td><h2>" .$row['animalName'] . "</h2></td>";
					echo "<td><h2>" .$row['breed'] . "</h2></td>";
					echo "<td><h2>" .$row['gender'] . "</h2></td>";
                    echo "<td><h2><img src=animalDetailsBlobs.php?id=".$row['id']." width=200 height=150/></h2></td>";					
					echo "<td><h2>" .$row['address'] . "</h2></td>";
					echo "<td><h2>" .$row['weight'] . "</h2></td>";
                    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>