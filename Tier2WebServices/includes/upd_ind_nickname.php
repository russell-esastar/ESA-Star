<?php

$nick_name = "";
if(isset($_REQUEST["nick_name"]))
	{
	$nick_name = $_REQUEST["nick_name"];
	$individual_id = "";
	if(isset($_REQUEST["individual_id"]))
		{
		$individual_id = $_REQUEST["individual_id"];
		$sql = "update individuals set nick_name=? where individual_id=?;";
		$params = array();
		$params[count($params)] = $nick_name;
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