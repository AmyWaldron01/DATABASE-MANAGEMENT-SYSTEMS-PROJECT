<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Billing Details Table</title>
	</head>	
	<body>
		<h4>Query: Select id,foodID,MedicationID, FirstName, LastName, billingDate, paymentType,FullOrHalf from BillingDetails; </h4>
		<table border="1">		
			<tr>
				<td><h2>ID</h2></td>
				<td><h2>foodID</h2></td>
                <td><h2>MedicationID</h2></td>
				<td><h2>FirstName</h2></td>
				<td><h2>LastName</h2></td>
                <td><h2>billingDate</h2></td>
                <td><h2>paymentType</h2></td>			
                <td><h2>FullOrHalf</h2></td>
			</tr>
			<?php			
				include('dbConfig.php');
				echo "Host: ".$host." Database: ".$database. " user: ".$username." password: ".$password ;							
				//Set connection to UTF-8
				mysqli_query($db,"SET NAMES utf8");
				
				//Select data
				$query = "Select id, foodID,MedicationID, FirstName, LastName, billingDate, paymentType,FullOrHalf from BillingDetails;";
				
				$result = mysqli_query($db,$query) or die("Bad Query.");
				mysqli_close($db);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['id'] . "</h2></td>";
					echo "<td><h2>" .$row['foodID'] . "</h2></td>";
					echo "<td><h2>" .$row['MedicationID'] . "</h2></td>";
					echo "<td><h2>" .$row['FirstName'] . "</h2></td>";
					echo "<td><h2>" .$row['LastName'] . "</h2></td>";
                    echo "<td><h2>" .$row['billingDate'] . "</h2></td>";
                    echo "<td><h2>" .$row['paymentType'] . "</h2></td>";
                    echo "<td><h2>" .$row['FullOrHalf'] . "</h2></td>";
                    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>