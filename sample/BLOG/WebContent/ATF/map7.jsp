<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="advanced.css" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
body {
	font-family: 'Roboto';
	background-color: #333;
}

h1 {
	color: #fff;
}
</style>
<!--[if lt IE 9]>
<script type="text/javascript" src="libs/jquery-extra-selectors.js"></script>
<script type="text/javascript" src="libs/html5shiv.js"></script>
<script type="text/javascript" src="libs/selectivizr-min.js"></script>
<![endif]-->
<script type="text/javascript" src="jquery.wrecker.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#container").wrecker({
			// options
			itemSelector : ".item",
			maxColumns : 4,
			responsiveColumns : [
				// windowMaxWidth : columns
				// windowMaxWidth order and values should match those in your responsive CSS
				{
					1024 : 3
				},
				{
					800 : 2
				},
				{
					640 : 1
				}
			]
		});
	});
</script>
</head>
<body>
	<div id="jquery-script-menu">
		<div class="jquery-script-center">
			<ul>
				<li><a href="블로그\main.html"></a></li>
				<li><a href="http://www.jqueryscript.net/"></a></li>
			</ul>
			<div class="jquery-script-ads">
				<script type="text/javascript">	<!--
																					google_ad_client = "ca-pub-2783044520727903";
																					/* jQuery_demo */
					google_ad_slot = "2780937993";
					google_ad_width = 728;
					google_ad_height = 90;
					//-->
				</script>
				<script type="text/javascript"
					src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
			</div>
			<div class="jquery-script-clear"></div>
		</div>
	</div>
	<div class="max-width">
		<h1>★☆ 오늘도 맛점 ★☆</h1>

		<div id="container">
			<!-- <div class="item"><img src="picture\J-img1.heic" width="640" height="480" alt=""/>
        <p></p></div> -->
			<div class="item">
				<img src="food1\f1.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f2.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f3.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f4.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f5.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f6.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f7.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f8.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f9.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f10.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f11.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f12.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f13.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f14.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f15.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f16.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f17.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f18.heic" width="640" height="480" alt="" />
			</div>
			<div class="item">
				<img src="food1\f19.heic" width="640" height="480" alt="" />
			</div>
		</div>
	</div>
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>