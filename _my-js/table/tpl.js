var table = document.getElementById("test");


for (var i=0; i < table.rows.length; i++) {

  for(var j = 0; j < table.rows[i].cells.length; j++) {

      table.rows[i].cells[j].addEventListener("click", function () {
          alert(this.innerHTML);
      });
  }


}
