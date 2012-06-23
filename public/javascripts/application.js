var isInitialPageLoad = true;

$(document).ready(function() {
  $('a[rel=navigation]').click(function(e) {
    e.preventDefault();
   
    history.pushState({ path: this.path }, '', this.href);
   
    updateContent(this.href);
  });
  
  $(window).bind('popstate', function() {
    if(!isInitialPageLoad) {
      updateContent(location.pathname);
    }
    
    isInitialLoad = false;
  });
});

function updateContent(path) {
  $.get(path, function(data) {
    $('#content').html(data);
  });
}

