$(document).ready(function() {
  $('.up_arrow').click(function(e){
    e.preventDefault();
    var postId = $(this).closest(".post")[0].id;
    var that = this;
    $.ajax({
      type: 'POST',
      url: '/posts/' + postId + '/votes',
      data: {value : 1},
    }).done(function(response){
      debugger;
      if (response.redirect){
        window.location = response.redirect
      } else {
        $(that).hide();
        pointsDisplay = $(that).closest(".post").find(".points")[0];
        pointsDisplay.innerHTML = parseInt(pointsDisplay.innerHTML) + response.value;
      }
    });
  });
});