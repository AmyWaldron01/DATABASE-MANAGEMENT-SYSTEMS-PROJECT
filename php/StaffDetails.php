<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>StafflDetails Table</title>
	</head>	
	<body>
		<h4>Query: Select id, animalName, name, breed, gender, picture, address, weight from animaldetails; </h4>
		<table border="1">		
			<tr>
				<td><h2>ID</h2></td>
				<td><h2>First Name</h2></td>
                <td><h2>Second Name</h2></td>
				<td><h2>address</h2></td>
				<td><h2>picture</h2></td>
				<td><h2>bio</h2></td>
                <td><h2>salary</h2></td>
				<td><h2>IBAN</h2></td>				
			</tr>
			<?php			
				include('dbConfig.php');
				echo "Host: ".$host." Database: ".$database. " user: ".$username." password: ".$password ;							
				//Set connection to UTF-8
				mysqli_query($db,"SET NAMES utf8");
				
				//Select data
				$query = "Select id, FirstName,SecondName, address, picture, bio, salary, IBAN from StaffDetails;";
				
				$result = mysqli_query($db,$query) or die("Bad Query.");
				mysqli_close($db);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['id'] . "</h2></td>";
					echo "<td><h2>" .$row['FirstName'] . "</h2></td>";
					echo "<td><h2>" .$row['SecondName'] . "</h2></td>";
					echo "<td><h2>" .$row['address'] . "</h2></td>";
                    echo "<td><h2><img src=staffDetailsBlobs.php?id=".$row['id']." width=200 height=150/></h2></td>";					
					echo "<td><h2>" .$row['bio'] . "</h2></td>";
					echo "<td><h2>" .$row['salary'] . "</h2></td>";
                    echo "<td><h2>" .$row['IBAN'] . "</h2></td>";
                    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>