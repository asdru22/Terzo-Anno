var c = -1;
const colors = ["green","orange","red"]
const luci = document.getElementsByClassName("circle");

const button = document.getElementById("button");
button.addEventListener('click', click)
document.addEventListener("DOMContentLoaded", click);

function click(){ 
  c = (c + 1) % 3;

  // Convert `luci` to an array for iteration
  Array.from(luci).forEach((luce) => {
    luce.removeAttribute("id");
  });

  // Access the correct element using index `c`
  luci[c].setAttribute("id", colors[c]);
  console.log(colors[c]);
}