<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Thx for comments!</title>
<?php

$hostname = "localhost";
$uname = "miz";
$upass = "karasu4949";
$dbname = "shippo";
$tblname = "entries";
$tblname2 = "comments";

if($_POST['c_text'])
{
	if( !$res_dbcon = mysql_connect($hostname, $uname, $upass))
	{
		print "MYSQL への接続に失敗しました";
		exit;
	}

	mysql_query("SET NAMES utf8"); //SQLに文字コードを通知.*重要*
	mysql_select_db( $dbname, $res_dbcon );

	// testing
	$entry_result = mysql_query("SELECT * from {$tblname} ORDER BY modified DESC LIMIT $offset, $limit",  $res_dbcon);
	$row = mysql_fetch_array( $entry_result, MYSQL_ASSOC );
	var_dump($row);



	post_comment($res_dbcon, htmlspecialchars($_POST['c_text']), htmlspecialchars($_POST['uname']), $_POST['target']);
}
else
{
	print("コメントをいれてください。なまえは無しでもだいじょうぶ");
}

function post_comment($res_dbcon, $txt, $uname, $target)
{
print("呼ばれてはいるよ");



mysql_query("INSERT INTO shippo.comments (cid ,eid ,uid ,uname ,istext ,text ,fname) VALUES (NULL , {$target}, NULL,  {$uname}, 1, {$txt}, NULL)", 
 $res_dbcon);
}

?>

</head>
<body>
</body>
</html>