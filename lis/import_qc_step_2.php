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
echo '<h1>Importing IQC of Miura-300</h1>';
$counter=0;
$uploaddir = '/';
$uploadfile = $uploaddir . basename($_FILES['import_file']['name']);
echo 'uploading from:'.$uploadfile;

		if($handle = fopen($_FILES['import_file']['tmp_name'], "r"))
		{
			while (($data = fgetcsv($handle, 0, ';')) !== FALSE) 
			{
				//QYYMMDDHH
				//123456789
				//format((qc_id/10000000),0)
				if(isset($data[1]) && isset($data[4]) && isset($data[3]) && isset($data[5]))
				{ 
				if(   	
					(($data[1]>500000000 && $data[1]<599999999) 
						||
					($data[1]>800000000 && $data[1]<899999999))
						 && 
					is_numeric($data[5])

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
					\''.$data[4].'\' ,				
					\''.$data[3].'\' ,
					\''.$data[5].'\' ,
					\''.$array_qc_target['target'].'\' ,
					\''.$array_qc_target['sd'].'\',
					\' \' 
					)';

							//echo '<br>'.$sql;
					if(!mysql_query($sql,$link))
					{
						echo '(insert)'.mysql_error();
						$sql_update=	'update qc set  
								result=	\''.$data[4].'\' where 		
								qc_id=	\''.$data[1].'\' and
								`repeat`=	\''.$data[5].'\' and
								ex_code=\''.$data[3].'\'';
						//echo '<br>'.$sql_update;
						if(!mysql_query($sql_update,$link))
						{
						echo '(update)'.mysql_error();
						}
						else
						{
 echo '<br>(update)['.mysql_affected_rows($link).']->'.$data[1].'->'.$data[4].'->'.$data[3].'->'.$data[5];
 $counter=$counter+mysql_affected_rows($link);
						}

					}
					else
					{
						echo '<br>(insert)['.mysql_affected_rows($link).']->'.$data[1].'->'.$data[4].'->'.$data[3].'->'.$data[5];
					}
		
					print_r($data);
				}
				else{echo '<br>'.$data[1].' is Non-QC/non-digit  or '.$data[4].' is non-numeric result';}
				}
    		}
			fclose($handle);
			echo '<h1>Updated data='.$counter.'</h1>';
		}
		else
		{
			echo 'can not fopen';
		}	
?>
