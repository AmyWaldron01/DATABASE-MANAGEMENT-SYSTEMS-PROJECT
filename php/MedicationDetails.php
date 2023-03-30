<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Medication Details Table</title>
	</head>	
	<body>
		<h4>Query: Select id, NameOfMeds, datasheet,price,cause from MedicationDetails; </h4>
		<table border="1">		
			<tr>
				<td><h2>ID</h2></td>
				<td><h2>NameOfMeds</h2></td>
                <td><h2>datasheet</h2></td>
				<td><h2>price</h2></td>
				<td><h2>cause</h2></td>			
			</tr>
			<?php			
				include('dbConfig.php');
				echo "Host: ".$host." Database: ".$database. " user: ".$username." password: ".$password ;							
				//Set connection to UTF-8
				mysqli_query($db,"SET NAMES utf8");
				
				//Select data
				$query = "Select id,NameOfMeds, datasheet, price, cause from MedicationDetails;";
				
				$result = mysqli_query($db,$query) or die("Bad Query.");
				mysqli_close($db);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['id'] . "</h2></td>";
					echo "<td><h2>" .$row['NameOfMeds'] . "</h2></td>";
					echo "<td><h2>" .$row['datasheet'] . "</h2></td>";
					echo "<td><h2>" .$row['price'] . "</h2></td>";
					echo "<td><h2>" .$row['cause'] . "</h2></td>";
                    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>