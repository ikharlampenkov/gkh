function addFile(id, fcount) {
    var box = document.getElementById(id);
    var count = document.getElementById(fcount);
    var content = "<input type=\"file\" name=\"qfile" + count.value + "\" /> ";

    box.innerHTML += content;
    count.value += 1;
}

function correctPager() {
    var a_list = $("a", "#pager");
    var rec = $('#rec_on_page').val();
    
    i = 0;
    for (i = 0; i < a_list.length; i++) {
        var temp_href = a_list[i].href;
        a_list[i].href = temp_href.toString().substr(0, temp_href.toString().lastIndexOf("=")+1) + rec;
        ;
    } 
}

function showHouse(id) {
    if ($("#house_" + id).css("display") == "none") {
        $("#house_" + id).css("display", "block");
    } else {
        $("#house_" + id).css("display", "none");
    }
}