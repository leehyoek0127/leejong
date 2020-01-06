
		(function ($) {
  // custom css expression for a case-insensitive contains()
  jQuery.expr[':'].Contains = function(a,i,m){
      return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase())>=0;
  };
 
  function filterList(header, list) { 
  // header is any element, list is an unordered list
    // create and add the filter form to the header
    var form = $("<form>").attr({"class":"filterform","action":"#"}),
        input = $("<input>").attr({"class":"filterinput","type":"text"});
    $(form).append(input).appendTo(header);
 
    $(input)
      .change( function () {
        var filter = $(this).val();
        if(filter) {
 	  
		  $matches = $(list).find('a:Contains(' + filter + ')').parent();
		  $('subli', list).not($matches).slideUp();
		  $matches.slideDown();
		    
        } else {
          $(list).find("subli").slideDown();
        }
        return false;
      })
    .keyup( function () {
        // fire the above change event after every letter
        $(this).change();
    });
  }
  //ondomready
  $(function () {
    filterList($("#form"), $("#list"));
  });
}(jQuery));
 
