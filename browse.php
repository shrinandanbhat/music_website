<?php 
include("includes/includedFiles.php");
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<style>
body {
	margin: 0;
	font-family: 'Josefin Sans', sans-serif;
	font-size: 16px;
	font-weight: 400;
	color: #777777;
	background-color: #14182a;
}
 a {
	color: #3bc8e7;
	transition: all 0.3s ease;
	text-decoration: none;
}
a:hover {
	color: white;
}
a:focus,
button:focus {
	outline: none;
}
.ms_color {
	color: #3bc8e7 !important
}
.ms-banner {
	padding: 0px 0px 40px;
}
.ms_banner_img {
	text-align: center;
	max-width: 511px;
	width: 100%;
	float: left;
}
.ms_banner_text {
	width: calc(100% - 511px);
	float: left;
	padding-top: 135px;
}
.ms_banner_text .ms_banner_btn .ms_btn {
	height: 40px;
	width: 100%;
	margin-right: 25px;
	line-height: 45px;
	margin-left: 0;
	max-width: 150px;
	font-weight: 600;
}
.ms_banner_text h1 {
	font-size: 45px;
	font-weight: bold;
	color: #fff;
}
.ms_banner_text p {
	margin: 5px 0px 40px;
	line-height: 30px;
}

.right form .button-area button {
    color: #fff;
    display: block;
    width: 160px!important;
    height: 45px;
    outline: none;
    font-size: 18px;
    font-weight: 500;
    border-radius: 6px;
    cursor: pointer;
    flex-wrap: nowrap;
    background: crimson;
    border: 2px solid crimson;
    transition: all 0.5s ease;
}

.right form .button-area button:hover {
    color: crimson;
    background: none;
}


/* footer section styling */

footer {
    background: #111;
    padding: 15px 23px;
    color: #fff;
    text-align: center;
}

footer span a {
    color: crimson;
    text-decoration: none;
}
</style>

</head>
<body>
<!---Banner--->
            <div class="ms-banner">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="ms_banner_img">
                                <img src="images/banner.png" alt="" class="img-fluid">
                            </div>
                            <div class="ms_banner_text">
                                <h1>This Month’s</h1>
                                <h1 class="ms_color">Record Breaking Albums !</h1>
                                <p>Dream your moments, Until I Met You, Gimme Some Courage, Dark Alley, One More Of A Stranger, Endless<br> Things, The Heartbeat Stops, Walking Promises, Desired Games and many more...</p>
                                <div class="ms_banner_btn">
                                    <a href="#view" class="ms_btn">Listen Now</a>
                                </div>
                                <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>

<h1 class="pageHeadingBig" style="width:500px;
    margin: 0 auto;
    text-align: center;">SONG FOR YOU</h1></div>
</body>
<div class="gridViewContainer" id="view">

	<?php
		$albumQuery = mysqli_query($con, "SELECT * FROM albums ORDER BY RAND() LIMIT 10");

		while($row = mysqli_fetch_array($albumQuery)) {
			echo "<div class='gridViewItem'>
					<span role='link' tabindex='0' onclick='openPage(\"album.php?id=" . $row['id'] . "\")''>
						<img src='" . $row['artworkPath'] . "'>

						<div class='gridViewInfo'>"
							. $row['title'] .
						"</div>
					</span>

				</div>";
		}
	?>
</div>
</html>