
const pics_src = ["キャンプ用品.jpg","背景2.png"];
let num = -1;

 
function start() {
  setInterval(slideshow_timer,1000); 
}
function slideshow_timer(){
  if (num === 1){
    num = 0;
  } 
  else {
    num ++;
  }
  document.getElementById("mypic").src = pics_src[num];
}
 
setInterval(slideshow_timer, 4000);
