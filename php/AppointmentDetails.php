<?php
//Send utf-8 header before any output
header('Content-Type: text/html; charset=utf-8'); 
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Appointment Details Table</title>
	</head>	
	<body>
		<h4>Query: Select id, animalName, name, breed, gender, picture, address, weight from AppointmentDetails; </h4>
		<table border="1">		
			<tr>
				<td><h2>ID</h2></td>
				<td><h2>staffID </h2></td>
                <td><h2>animalID</h2></td>
				<td><h2>dateOfApp</h2></td>
				<td><h2>timeOfApp</h2></td>
				<td><h2>location</h2></td>
                <td><h2>symptoms</h2></td>
				<td><h2>diagnosis</h2></td>		
                <td><h2>medication</h2></td>				
			</tr>
			<?php			
				include('dbConfig.php');
				echo "Host: ".$host." Database: ".$database. " user: ".$username." password: ".$password ;							
				//Set connection to UTF-8
				mysqli_query($db,"SET NAMES utf8");
				
				//Select data
				$query = "Select id, staffID,animalID, dateOfApp,timeOfApp, location,symptoms, diagnosis, medication from AppointmentDetails;";
				
				$result = mysqli_query($db,$query) or die("Bad Query.");
				mysqli_close($db);

				while($row = $result->fetch_array())
				{		
					echo "<tr>";
					echo "<td><h2>" .$row['id'] . "</h2></td>";
					echo "<td><h2>" .$row['staffID'] . "</h2></td>";
					echo "<td><h2>" .$row['animalID'] . "</h2></td>";
					echo "<td><h2>" .$row['dateOfApp'] . "</h2></td>";				
					echo "<td><h2>" .$row['timeOfApp'] . "</h2></td>";
					echo "<td><h2>" .$row['location'] . "</h2></td>";
                    echo "<td><h2>" .$row['symptoms'] . "</h2></td>";
                    echo "<td><h2>" .$row['diagnosis'] . "</h2></td>";
                    echo "<td><h2>" .$row['medication'] . "</h2></td>";
                    echo "</tr>";
				}
			?>
		<table>
	</body>
</html>