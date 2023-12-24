<?php


include("../../config.php");

if(isset($_POST['playlistId'])) {

	$playlistId = $_POST['playlistId'];
	$query = "CALL DeletePlaylist($playlistId)";
    $result = mysqli_query($con, $query);

   if ($result) {
       echo "Playlist deleted successfully!";
    } else {
        echo "Error deleting playlist: " . mysqli_error($con);
    }

}

else {
	echo "PlaylistId was not passed into deletePlaylist.php";
}


?>