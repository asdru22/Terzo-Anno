let username

document.getElementById("button").onclick = function () { 
  username = document.getElementById("text").value
  document.getElementById("head").textContent = "welcome, "+username
}