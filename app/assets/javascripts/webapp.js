function types_filter(city_id){
	var checkboxes = document.getElementsByClassName('types_filter');
	var selected = [];
	  for (var i=0; i<checkboxes.length; i++) {
	      if (checkboxes[i].checked) {
	          console.log(checkboxes[i].value);
	          selected.push(checkboxes[i].value);
	      }
	  }
  url_path = "/citylookup/types_filter/?selected_types=" + selected  + "&city_id="+ city_id;
  $.ajax({
    url : url_path,
    success : function(result) {

    },
  }); 
}