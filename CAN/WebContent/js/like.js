function doLike(postID, email_ID) {
	console.log(postID + ", " + email_ID);
	
	const DATA = {
		postID: postID,
		email_ID: email_ID,
		operation: 'like'
	}
	
	$.ajax({
		type: "POST",
		url: "LikePost",
		data: DATA,
		success: function(data, textStatus, jqXHR) {
			console.log(data);
			
			if(data.trim() == 'true') {
				let counter = $(".like-counter").html();
				
				counter++;
				
				$(".like-counter").html(counter);
			}
		},
		error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
	});
}