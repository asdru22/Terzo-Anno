document.addEventListener("DOMContentLoaded", () => {
  let array_1 = {}, array_2 = {}
  let c1 = document.getElementsByClassName("C1")
  let c2 = document.getElementsByClassName("C2")
  let c = 0;
  for (let i = 0; i < c1.length; i++){
    array_1["key_" + c] = c1[i].textContent
    c++;
  }
  for (let i = 0; i < c2.length; i++){
    array_1["key_" + c] = c2[i].textContent
    c++;
  }
  for (let key in array_1) {
    array_2[key] = array_1[key]+"_placeholder"
  }
  console.log("Array1:", array_1)
  console.log("Array2:",array_2)
})