
let dropdown = document.querySelector('#dropdown_button');
dropdown.addEventListener('click', function(event) {
    event.stopPropagation();
    dropdown.classList.toggle('is-active');
});