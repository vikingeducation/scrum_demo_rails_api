$(document).ajaxError(function(event, jqxhr, settings, error){
  console.log(jqxhr.status + ": " + error);
  $("[data-errors]").append(error + ": " + jqxhr.responseJSON.errors.join(", "));
});
