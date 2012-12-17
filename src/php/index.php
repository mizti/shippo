<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>オエカキ☆サンプン</title>
	<style>
		.head		{background-color:#f0f8ff;
		width:900px;
		height:180px;
		border:0px;
		margin:0 0 0 0;
		}
		.head h1	{
		font-size:24px;
		font-family:'Comic Sans MS';
		color:black;
		margin-bottom:1px
		}
		.head h2	{
		}
		.head div	{
		font-size:12px;
		color:black}
		.head1		{width:45px;
		text-align:right;
		border-right:0px;
		}
		.head2		{padding-left:9px;
		text-align:left;
		border-right:0px;
		}
		.side_main	{width:900px;
		top:0px;
		border:0px;
		}
		.side		{background-color:#f0f8ff;
		width:150px;
		vertical-align:top;
		border-right:0px;
		}
		.main		{
		padding-left:30px;
		padding-right:30px;
		border-right:0px;
		}

		.entry		{
		margin-top:30px;
		margin-bottom:80px;
		}
	</style>
	<?php
	$hostname = "localhost";
	$uname = "miz";
	$upass = "karasu4949";
	$dbname = "shippo";
	$tblname = "entries";
	$tblname2 = "comments";

	$page = $_GET[page];
	$nextPage = $page + 1;
	$limit = 5;

	if($page != NULL)
	{
		$offset = $page * $limit;
	}
	else
	{
		$offset = 0;
	}

	$currentPage = "http://".$_SERVER['SERVER_NAME'] ."/shippo/php/index.php";
	$oekakiPage="http://".$_SERVER['SERVER_NAME'] ."/shippo/shippo.html";

	//include('post.php');

	if( !$res_dbcon = mysql_connect($hostname, $uname, $upass))
	{
		print "MYSQL への接続に失敗しました";
		exit;
	}

	mysql_query("SET NAMES utf8"); //SQLに文字コードを通知.*重要*
	mysql_select_db( $dbname, $res_dbcon );
	
	$entry_result = mysql_query("SELECT * from {$tblname} ORDER BY modified DESC LIMIT $offset, $limit",  $res_dbcon);
	$entry_num = 	mysql_num_rows(mysql_query("SELECT * from {$tblname}",  $res_dbcon));
	?>
</head>
<body>
	<!--ヘッダーテーブル -->
	<table class="head">
	<tr>
		<td class="head1"><img src="../assets/logo.gif" alt="まだないよ"></td>
		<td class="head2">
			<h1 lang="en">オエカキ ☆ サンプン</h1>
			<div>3分間の中で気楽に描いたり、精一杯描いたり。</div>
		</td>
	</tr>
	</table>

	<table class="side_main" cellspacing="0">
	<tr>
		<!--サイド-->
		<td class="side">
			<div>
				<a href="../shippo.html">描いてみる！</a>
			</div>
<br>
<!--
			<div>
				<s>ログイン</s> 準備中
			</div>
			<div>
				<s href="">新規登録</s> 準備中
			</div>
-->

			<div>
				<a href="">このサイトについて</a>
			</div>
			<br>
		</td>
		<!--main source -->
		<td class="main">
		<?php
		while( $row = mysql_fetch_array( $entry_result, MYSQL_ASSOC ) ){?>
		<div class="entry">
			<div class="title">
			<?php

			if($row["title"] != NULL)
			{
				echo("<h1>『$row[title]』</h1>");
			}
			else
			{
				echo("無題");
			}
			?>
			</div>
			<div class="image">
				<img src="../images/<?php echo($row["fname"]);?>"/>
			</div>
			<div class="comment"><?php 
					$comment_result = mysql_query("SELECT * from {$tblname2} WHERE eid = $row[eid]", $res_dbcon);
					if( $comment = mysql_fetch_array($comment_result, MYSQL_ASSOC))
					{
						print("コメント");
						print($comment[text]);
					}
			 ?></div>
			<div class="comment_post">
					<p><a href="<?php print($oekakiPage."?eid=$row[eid]");?>">レス絵をつける</a></p>
				<form method="post" action="post.php">
					<p>おなまえ<input type="text" name="uname">
						コメント<input type="text" name="c_text"><input type="submit" value="送信"><input type="hidden" value="<?php print($row[eid]); ?>" name="target">
						<!-- ここではhiddenを使っても大丈夫だけど、ちゃんとセッション変数で渡すべきところは渡すこと --></p>
				</form>
			</div>
		</div>
		<?php }?>
		<div class = "next">
			<p>
				<a href="<?php 
				echo($currentPage."?page=".$nextPage);  
					?>">次のページへ</a>
			</p>
		</div>
		</td>
	</tr>
	</table>

<?php 
	//MySQL への接続を切断する。
	//この処理を行わなくてもプログラム終了時に自動的に切断される。
	mysql_close( $res_dbcon );
?>
</body>
</html>