<?php
session_start();
if(isset($_SESSION['login'])){
 	include "koneksi.php";
 	include "fungsi.php";
?>

<!DOCTYPE html>
<html>
<head>
	<title>Laporan Data Golongan</title>
	<style type="text/css">
		body{
			font-family: Arial;
		}
		table{
			border-collapse: collapse;
		}

		@media print{
			.no-print{
				display: none;
			}
		}
	</style>
</head>
<body>
<h3>CV. SARI BUMI SAKTI</h3>
<hr>
<p>LAPORAN DATA GOLONGAN</p>
<table border="1" cellpadding="4" cellspacing="0" width="100%">
	<tr>
		<th>No.</th>
		<th>kode</th>
		<th>Nama Golongan</th>
		<th>Tunj. Suami/Istri</th>
		<th>Tunj. Anak</th>
		<th>Uang Makan</th>
		<th>Uang Lembur</th>
		<th>Askes</th>
	</tr>

	<?php 
	$sql=mysqli_query($konek, "SELECT * FROM golongan ORDER BY kode_golongan ASC");
	$no = 1;
	while ($d=mysqli_fetch_array($sql)) {
		echo "<tr>
 			<td align='center' width='40px'>$no</td>
 			<td align='center'>$d[kode_golongan]</td>
 			<td>$d[nama_golongan]</td>
 			<td>".buatRp($d['tunjangan_suami_istri'])."</td>
 			<td>".buatRp($d['tunjangan_anak'])."</td>
 			<td>".buatRp($d['uang_makan'])."</td>
 			<td>".buatRp($d['uang_lembur'])."</td>
 			<td>".buatRp($d['askes'])."</td>	
		</tr>";
		$no++;
	}

	if(mysqli_num_rows($sql) < 1){
		echo "<tr><td colspan='8'>Belum Ada data...</td>";
	}			
	?>
	
</table>

<table width="100%">
	<tr>
		<td></td>
		<td width="200px">
			<p>
				Jakarta Barat, <?php echo tglIndonesia(date('Y-m-d')); ?>
				<br>
				Administrator,
			</p>
			<br>
			<br>
			<br>
			<p>__________________________________</p>
		</td>
	</tr>
	
</table>

<a href="#" class="no-print" onclick="window.print();">Cetak/Print</a>

</body>
</html>

<?php 
}else{
	header('location:login.php');
}
?>
