<?php

$name_prefix = "";
if(isset($_REQUEST["name_prefix"]))
	{
	$name_prefix = $_REQUEST["name_prefix"];
	$individual_id = "";
	if(isset($_REQUEST["individual_id"]))
		{
		$individual_id = $_REQUEST["individual_id"];
		$sql = "update individuals set name_prefix=? where individual_id=?;";
		$params = array();
		$params[count($params)] = $name_prefix;
		$params[count($params)] = $individual_id;
		$result = exe_shell($sql, $params, $path);
		$results["ws_status"] = "success";
		$results["ws_msg"] = "";
		}
	else
		{
		$results["ws_status"] = "failed";
		$results["ws_msg"] = "Individual ID not specified. Individual ID is a required input.";	
		}
	}

?>