var months = new Array("января","февраля","марта","апреля","мая","июня","июля","августа","сентября","октября","ноября","декабря");
var dt = new Date();

function printDate(){
 str=dt.getDate()+" "+months[dt.getMonth()]+" "+dt.getYear()+"г.";
 return str;
}

function printTime(){
  str=dt.getHours()+":"+dt.getMinutes();
  return str;
}


function createAnswer() {
  a_count = document.getElementById("a_count").value;
  str_out = "<table width=\"100%\">";
  for (i = 1; i <= a_count; i++) {
  	 str_out = str_out + "<tr><td width=\"10\">" + i + ".</td><td><input name=data[answer][" + i + "][text] ></td></tr>";
  }
  str_out = str_out + "</table>";
  content_out = document.getElementById("a_place");
  content_out.innerHTML = str_out;
}
