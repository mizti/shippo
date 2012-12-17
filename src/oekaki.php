<?php 
$path = '../shippo/images';
//$res_dir = opendir($path);
?>
<html>
<head>
<title>オエカキ☆サンプン(α)</title>
<meta http-equiv="Content-Type" content="text/html; charset=SHIFT_JIS">
</head>
<body>


<div>
<h1>オエカキ☆サンプン(α)</h1><br>
息抜きとかにどうぞ。
</div>


<div><h3><a href="http://mono.kmc.gr.jp/~miz/shippo/shippo.html">描いてみる！</a></h3><a href="http://mono.kmc.gr.jp/~miz/shippo/manual.html">使い方とか</a>　　<a href="http://mono.kmc.gr.jp/~miz/shippo/updatelog.html">更新履歴</a></div>

<br>

<?php
/*
while($file_name = readdir($res_dir))
{
	$log_stc[] = $filename;
	print($log_stc);
	
	if($file_name == "." || $file_name == "..")
	{
		continue;
	}
	print "<p>".$file_name."<br>";
	print "<img src='../shippo/images/$file_name'/></p>"."\n";
}
*/


$dh  = opendir($path);
while (false !== ($filename = readdir($dh))) {
    $files[] = $filename;
}

rsort($files);
for($i = 0; $i < count($files); $i++)
{
	if($files[$i] == "." || $files[$i] == "..")
	{
		continue;
	}
		print "<img src='../shippo/images/$files[$i]'/></p>"."\n";
}
?>
</body>
</html>