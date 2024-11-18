/*
function onclick_fn() {
alert("hello world")
}
*/

/*
let onclick_fn = () => alert("hello world")
*/

/*
function onclick_fn() {
  var innerHTML = document.getElementsByTagName("h1")[0].innerHTML;
  var p1 = document.getElementById("para1");
  p1.textContent = innerHTML;
}
*/

/*
function onclick_fn() { 
  var button = document.getElementsByTagName("button")[0];
  button.disabled = true;
  var para = document.getElementById("para1");
  const max_sec = 10;
  var sec = max_sec;
  var old_text = para.textContent
  para.textContent = max_sec;

  var timer = setInterval(() => { 
    para.textContent = --sec;
    if (sec <= 0) { 
      clearInterval(timer);
      button.disabled = false;
      para.textContent = old_text;
    }
  },
    100)
}
*/

