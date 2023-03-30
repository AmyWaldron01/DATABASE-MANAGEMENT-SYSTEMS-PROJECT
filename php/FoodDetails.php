<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Food Details Table</title>
	</head>	
	<body>
		<h4>Query: Select id, AnimalType, supplier,size,price,QuantityinStock from FoodDetails ; </h4>
		<table border="1">		
			<tr>
				<td><h2>ID</h2></td>
				<td><h2>AnimalType</h2></td>
                <td><h2>supplier</h2></td>
				<td><h2>size</h2></td>
				<td><h2>price</h2></td>		
                <td><h2>QuantityinStock</h2></td>			
			</tr>
			<?php			
				include('dbConfig.php');
				echo "Host: ".$host." Database: ".$database. " user: ".$username." password: ".$password ;							
				//Set connection to UTF-8
				mysqli_query($db,"SET NAMES utf8");
				
				//Select data
				$query = "Select id, AnimalType,supplier,size,price,QuantityinStock from FoodDetails;";
				
				$result = mysqli_query($db,$query) or die("Bad Query.");
				mysqli_close($db);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['id'] . "</h2></td>";
					echo "<td><h2>" .$row['AnimalType'] . "</h2></td>";
					echo "<td><h2>" .$row['supplier'] . "</h2></td>";
					echo "<td><h2>" .$row['size'] . "</h2></td>";
					echo "<td><h2>" .$row['price'] . "</h2></td>";
                    echo "<td><h2>" .$row['QuantityinStock'] . "</h2></td>";
                    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>