<?php
include('koneksi.php');
$country = mysqli_query($koneksi,"SELECT * FROM country");
while($row = mysqli_fetch_array($country)){
	$nama_country[] = $row['country'];
	
	$query = mysqli_query($koneksi,"SELECT sum(total_cases) AS total_cases FROM penderita WHERE id_country='".$row['id_country']."'");
	$row = $query->fetch_array();
	$total_cases[] = $row['total_cases'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Grafik Total Case Covid-19</title>
	<script type="text/javascript" src="Chart.js"></script>
</head>
<body>
	<div style="width: 800px;height: 800px">
		<canvas id="myChart"></canvas>
	</div>


	<script>
		var ctx = document.getElementById("myChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: <?php echo json_encode($nama_country); ?>,
				datasets: [{
					label: 'Grafik Total Cases Penderita Covid-19',
					data: <?php echo json_encode($total_cases); ?>,
					backgroundColor: 'rgba(255, 99, 132, 0.2)',
					borderColor: 'rgba(255,99,132,1)',
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero:true
						}
					}]
				}
			}
		});
	</script>
</body>
</html>