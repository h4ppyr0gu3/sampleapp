var dropdown_btn = document.getElementById("dropdown_button");
if (dropdown_btn) {
var dropdown_box = dropdown_btn.children[1];
var toggle = true;

dropdown_btn.addEventListener("click", (event) => {
	event.preventDefault();

	if(toggle){
		dropdown_box.style.display = "block";
	} else {
		dropdown_box.style.display = "none";
	}

	toggle = !toggle;
});
}