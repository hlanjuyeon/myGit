var modal = document.getElementById("modal");
var modal1 = document.getElementById("modal1");
var btn = document.getElementById("inButton");
var span = document.getElementsByClassName("close")[0];
var disagree = document.getElementById("disagree");
var agree = document.getElementById("agree");
var btn1 = document.getElementById("outButton");
var span1 = document.getElementsByClassName("close")[1];
var agree1 = document.getElementById("agree1");
var disagree1  = document.getElementById("disagree1");

btn.onclick = function() {
	modal.style.display = "block";
}

btn1.onclick = function() {
	modal1.style.display = "block";
}

span.onclick = function() {
	modal.style.display  = "none";
}	

span1.onclick = function() {
	modal1.style.display = "none";
}

disagree.onclick = function() {
	modal.style.display = "none";
}

disagree1.onclick = function() {
	modal1.style.display = "none";
}

agree.onclick = function() {
	modal.style.display = "none";
	return "commute";
}	
