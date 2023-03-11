<?php
session_start();

//echo '<pre>';
//print_r($GLOBALS);
//echo '</pre>';

include 'common.php';



if(!login_varify())
{
exit();
}

main_menu();


$link=start_nchsls();
echo '<h1>Importing IQC of Erba-XL-640</h1>';
$counter_insert=0;
$counter_update=0;
$uploaddir = '/';
$uploadfile = $uploaddir . basename($_FILES['import_file']['name']);
echo 'uploading from:'.$uploadfile.'<br>';

		if($handle = fopen($_FILES['import_file']['tmp_name'], "r"))
		{
			while (($data = fgetcsv($handle, 0, chr(9))) !== FALSE) 
			{
				//QYYMMDDHH
				//123456789
				//format((qc_id/10000000),0)
				if(isset($data[1]) && isset($data[8]) && isset($data[3]) && isset($data[4]))
				{ 
				if(   	
					(($data[1]>500000000 && $data[1]<599999999) 
						||
					($data[1]>800000000 && $data[1]<899999999))
						 && 
					is_numeric($data[4])
				  )	
				{
					$sql_qc_target = 'select * from qc_target where ex_code=\''.$data[3].'\' and qc_type=format('.$data[1].'/100000000, 0)';
					//echo $sql_qc_target;
					$result_qc_target=mysql_query($sql_qc_target,$link);
					if(!$result_qc_target){echo 'error at following sql:'.$sql_qc_target.mysql_error();}
					$array_qc_target=mysql_fetch_assoc($result_qc_target);
					//qc_id,repeat,ex_code,result
					$sql='insert into qc values(
					\''.$data[1].'\' ,				
					\''.$data[8].'\' ,				
					\''.$data[3].'\' ,
					\''.$data[4].'\' ,
					\''.$array_qc_target['target'].'\' ,
					\''.$array_qc_target['sd'].'\',
					\' \' 
					)';

							//echo '<br>'.$sql;
					if(!mysql_query($sql,$link))
					{
						echo '(insert)'.mysql_error().'<br>';
						$sql_update=	'update qc set  
								result=	\''.$data[4].'\' where 		
								qc_id=	\''.$data[1].'\' and
								`repeat`=	\''.$data[8].'\' and
								ex_code=\''.$data[3].'\'';
						//echo '<br>'.$sql_update;
						if(!mysql_query($sql_update,$link))
						{
						echo '(update)'.mysql_error().'<br>';
						}
						else
						{
 echo '(update)['.mysql_affected_rows($link).']->'.$data[1].'->'.$data[8].'->'.$data[3].'->'.$data[4].'<br>';
 $counter_update=$counter_update+mysql_affected_rows($link);
						}

					}
					else
					{
						echo '(insert)['.mysql_affected_rows($link).']->'.$data[1].'->'.$data[8].'->'.$data[3].'->'.$data[4].'<br>';
						$counter_insert=$counter_insert+mysql_affected_rows($link);
					}
		
					//print_r($data);
				}
				else{echo '<br>'.$data[1].' is Non-QC/non-digit  or '.$data[4].' is non-numeric result';}
				}
    		}
			fclose($handle);
			echo '<h1>Updated data='.$counter_update.'</h1>';
			echo '<h1>Inserted data='.$counter_insert.'</h1>';
		}
		else
		{
			echo 'can not fopen';
		}	
?>
