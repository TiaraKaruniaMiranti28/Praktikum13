<?php
include('koneksi.php');
$country = mysqli_query($koneksi,"SELECT * FROM country");
while($row = mysqli_fetch_array($country)){
	$nama_country[] = $row['country'];
	
	$query = mysqli_query($koneksi,"SELECT sum(active_cases) AS active_cases FROM penderita WHERE id_country='".$row['id_country']."'");
	$row = $query->fetch_array();
	$active_cases[] = $row['active_cases'];
}
?>
<!doctype html>
<html>

<head>
	<h1>ANGKA ACTIVE CASES COVID-19</h1>
	<script type="text/javascript" src="Chart.js"></script>
</head>

<body>
	<div id="canvas-holder" style="width: 800px;height: 800px">
		<canvas id="chart-area"></canvas>
	</div>
	<script>
		var config = {
			type: 'pie',
			data: {
				datasets: [{
					label: 'Presentase Active Cases Covid-19',
					data:<?php echo json_encode($active_cases); ?>,
					backgroundColor: [
					'#29B0D0',
					'#2A516E',
					'#F07124',
					'#CBE0E3',
					'#979193',
					'#D2691E',
					'#E9967A',
					'#CD5C5C',
					'#FFB6C1',
					'#FFFFE0'
					],
					borderColor: [
					'#29B0D0',
					'#2A516E',
					'#F07124',
					'#CBE0E3',
					'#979193',
					'#D2691E',
					'#E9967A',
					'#CD5C5C',
					'#FFB6C1',
					'#FFFFE0'
					],
				}],
				labels: <?php echo json_encode($nama_country); ?>},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});

			window.myPie.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var newDataset = {
				backgroundColor: [],
				data: [],
				label: 'New dataset ' + config.data.datasets.length,
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());

				var colorName = colorNames[index % colorNames.length];
				var newColor = window.chartColors[colorName];
				newDataset.backgroundColor.push(newColor);
			}

			config.data.datasets.push(newDataset);
			window.myPie.update();
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myPie.update();
		});
	</script>
</body>
</html>