$(document).on("turbolinks:load",function(){
	console.log('event triggered!')

	var notification_boxes = document.getElementsByClassName("notification");
	// console.log(notification_boxes);
	if(notification_boxes.length > 0){
			console.log(notification_boxes.length);
			var delete_btn;

		for(let i=0; i < notification_boxes.length; i++){
			// console.log(notification_boxes, notification_boxes[i]);

			// var box = 
			delete_btn = notification_boxes[i].children[0];
			// console.log(delete_btn);
			console.log(notification_boxes[i].children[0]);

			// delete_btn.classList.add("hide_notification")

			function myFunction() {

				notification_boxes.classList.add("hide_notification")
			} 

			window.setTimeout(myFunction, 20);

				
			
			console.log(delete_btn);
		}
	}
})