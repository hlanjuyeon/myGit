// darkmode script
function darkMode() {
    var dropdown = document.querySelector(".dropdown-btn");
    var element = document.body;
    var dark = document.querySelector(".darkmode_div");
    var notice = document.querySelector(".notice");
    var commute = document.querySelector(".commute");
	var box = document.querySelector(".time");
    var notice = document.querySelector(".notice");
    element.classList.toggle('on');
    dropdown.classList.toggle('on');
    dark.classList.toggle('on');
    notice.classList.toggle('on');
    commute.classList.toggle('on');
    box.classList.toggle('on');
    
}