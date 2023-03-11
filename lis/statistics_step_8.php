<?php
session_start();

echo '<html>';
echo '<head>';
echo '<title>Clinical Chemistry, LSB</title>';

echo '</head>';
echo '<body>';


//echo '<pre>';
//print_r($GLOBALS);
//echo '</pre>';

include 'common.php';


if(!login_varify())
{
exit();
}

second_menu();

echo '<h2 style="page-break-before: always;"></h2>';

$link=start_nchsls();

//$yymm=1210;
$yymm=$_POST['yymm'];
list($yy,$mm) = str_split($yymm,2); 
//echo $yymm;
//echo $yy;
//echo $mm;

////////////////////////////////////////////////////////////////////////////////// check that the entered yydd are proper

if (strlen($yymm)>4)		// if more than 4 digit number is entered
{
	echo '<h3>Incorrect "yymm" entry.</h3>';
	exit();
}

if($mm < 1 || $mm > 12 || $yymm < 1101 || $yymm > 9912)
{
echo '<h3>Incorrect "yymm" entry.</h3>';
//echo '<h3>You entered year = '.$yy.' and month = '.$mm.' !!!</h3>';
exit();
}

$current_yymm=strftime('%y%m');
//echo $current_yymm;

if($yymm > $current_yymm)		// any future yymm
{
echo '<h3>You just entered year='.$yy.' and month='.$mm.' !!!</h3>';
echo '<h3>The system is not aware of the future !</h3>';
exit();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// to find name of entered month
$month_name = date( 'F', mktime(0, 0, 0, $mm, 1) );
//echo $month_name;

// to calculate days of the entered month
$entered_month_days = cal_days_in_month(CAL_GREGORIAN, $mm, $yy);
//echo $entered_month_days;

echo '<table border=1 style="border-collapse:collapse;">';
echo '<tr><th colspan=10 bgcolor=lightblue style=\'font-size:110%\'>CLINICAL CHEMISTRY SECTION, Laboratory Services, GMERS MEDICAL COLLEGE & Hospital,Gotri-Vadodara</th></tr>';
echo '<tr><th colspan=10 bgcolor=lightgreen style=\'font-size:110%\'>Sample individual statistics for the month of '.$month_name.' 20'.$yy.'</th></tr>';
echo '<tr align=center bgcolor=gold>
	<td><b>Date</b></td>
	<td><b>Routine (Indoor)</b></td>
	<td><b>Urgent</b></td>
	<td><b>OPD</b></td>
	<td><b>Lipid Profile</b></td>
	<td><b>Thyroid Profile</b></td>
	<td><b>ABG</b></td>
    <td><b>ART</b></td>
    <td><b>Camp</b></td>'
;
for ( $dd=01; $dd<=$entered_month_days ; $dd ++) 
	{
//echo $yymm.$dd;

		// to get day of week from date
		$jd=cal_to_jd(CAL_GREGORIAN,date("$mm"),date("$dd"),date("$yy"));
		$day=(jddayofweek($jd,1));

		//////// to convert 1 to 9 dates to 01 to 09
		$dd=str_pad((int) $dd,2,"0",STR_PAD_LEFT);
	

		// for routine indoor patient samples --> sample_id 0001 to 1000
		$a1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'0001\' and \''.$yymm.$dd.'1000\'';
		$a2=mysql_query($a1,$link);
		$a3=mysql_fetch_assoc($a2);
		
		$str .= ",".join('","',array_values($a3));
		
	
			
		// for urgent samples --> sample_id 1001 to 2000
		$b1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'1001\' and \''.$yymm.$dd.'2000\'';
		$b2=mysql_query($b1,$link);
		$b3=mysql_fetch_assoc($b2);
		$str1 .= ",".join(",",array_values($b3));
		//print_r($b3);

		// for OPD samples --> sample_id 2001 to 3000
		$c1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'2001\' and \''.$yymm.$dd.'3000\'';
		$c2=mysql_query($c1,$link);
		$c3=mysql_fetch_assoc($c2);
$str2 .= ",".join(",",array_values($c3));
		//print_r($c3);

		// for lipid profile samples --> sample_id 3001 to 4000
		$d1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'3001\' and \''.$yymm.$dd.'4000\'';
		$d2=mysql_query($d1,$link);
		$d3=mysql_fetch_assoc($d2);
$str3 .= ",".join(",",array_values($d3));
		//print_r($d3);

		// for thyroid profile samples --> sample_id 4001 to 5000
		$e1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'4001\' and \''.$yymm.$dd.'5000\'';
		$e2=mysql_query($e1,$link);
		$e3=mysql_fetch_assoc($e2);
$str4 .= ",".join(",",array_values($e3));
		//print_r($e3);

		// for ABG samples --> sample_id 5001 to 6000
		$f1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'5001\' and \''.$yymm.$dd.'6000\'';
		$f2=mysql_query($f1,$link);
		$f3=mysql_fetch_assoc($f2);
$str5 .= ",".join(",",array_values($f3));
		//print_r($f3);

// for ARTsamples --> sample_id 6001 to 7000
		$g1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'6001\' and \''.$yymm.$dd.'7000\'';
		$g2=mysql_query($g1,$link);
		$g3=mysql_fetch_assoc($g2);
$str6 .= ",".join(",",array_values($g3));
		//print_r($g3);
   // for Camp samples --> sample_id 7001 to 8000
		$h1= 'SELECT count(`sample_id`) FROM `sample` WHERE `sample_id` between \''.$yymm.$dd.'7001\' and \''.$yymm.$dd.'8000\'';
		$h2=mysql_query($h1,$link);
		$h3=mysql_fetch_assoc($h2);
$str7 .= ",".join(",",array_values($h3));
		//print_r($h3);

		echo '<tr>';

		if ($odd = $dd%2){$td='<td bgcolor=lightyellow align=center>';}else{$td='<td bgcolor=lightgray align=center>';}
		
		echo 	$td.$dd.'/'.$mm.'/'.$yy.'</td>';
		echo 	$td.$a3['count(`sample_id`)'].'</td>';
		echo	$td.$b3['count(`sample_id`)'].'</td>';
		echo	$td.$c3['count(`sample_id`)'].'</td>';
		echo	$td.$d3['count(`sample_id`)'].'</td>';
		echo	$td.$e3['count(`sample_id`)'].'</td>';
		echo	$td.$f3['count(`sample_id`)'].'</td>';
        echo	$td.$g3['count(`sample_id`)'].'</td>';
        echo	$td.$h3['count(`sample_id`)'].'</td>';
		
		echo '</tr>';	
}

         
     

echo '<tr bgcolor=gold align=center><td><b>Total</b></td><td><b>'.array_sum(explode(",",$str)).'</b></td><td><b>'.array_sum(explode(",",$str1)).'</b></td>
<td><b>'.array_sum(explode(",",$str2)).'</b></td><td><b>'.array_sum(explode(",",$str3)).'</b></td><td><b>'.array_sum(explode(",",$str4)).'</b></td><td><b>'.array_sum(explode(",",$str5)).'</b></td><td><b>'.array_sum(explode(",",$str6)).'</b></td><td><b>'.array_sum(explode(",",$str7)).'</b></td>
</tr>';
  
    echo '</table>';

    ?>
