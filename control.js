const slides = document.getElementsByClassName("slide");
var idx = parseInt(location.href.split("#").pop());
if (isNaN(idx)) {
  idx = 0;
}
function next() {
  if (idx < slides.length) {
    idx += 1;
  }
  location.href = "#" + idx;
}
function prev() {
  if (idx > 1) {
    idx -= 1;
  }
  location.href = "#" + idx;
}
document.addEventListener(
  "keydown",
  e => {
    if (e.key == "PageDown" || e.key == "ArrowRight") {
      next();
    } else if (e.key == "PageUp" || e.key == "ArrowLeft") {
      prev();
    }
  }
);
// document.addEventListener(
//   "wheel",
//   e => {
//     if (e.deltaY > 0) {
//       next();
//     } else {
//       prev();
//     }
//   }
// );


