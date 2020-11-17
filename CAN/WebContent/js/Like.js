function doLike(postID, email_ID) {
	console.log(userID + ", " + email_ID);
	
	const DATA = {
		postID: postID,
		email_ID: email_ID,
		operation: 'like'
	}
	
	$.ajax({
		url: "LikePostServlet",
		data: DATA,
		success: function(data, textStatus, jqXHR) {
			console.log(data);
		},
		error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
	})
}