function deleteComment(event){
  event.preventDefault();
  var $comment = $(event.target);
  var url = $comment.attr("href");

  $.ajax({
    url: url,
    method: "DELETE",
    success: function(response){
      $("[data-comment-id=" + response.comment.id + "]").remove();
    }
  });

  return false;
}

$(document).ready(function(){
  $("body").on("click", "[data-comment-destroy]", deleteComment);
});
