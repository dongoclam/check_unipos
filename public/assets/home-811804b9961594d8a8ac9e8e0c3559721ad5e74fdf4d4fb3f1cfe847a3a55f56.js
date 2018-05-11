var typingTimer;

$(document).on("keyup", ".search", function() {
  var name = $(this).val();
  clearTimeout(typingTimer);
  typingTimer = setTimeout(function() {
    loadUsers(name);
  }, 500);
});

function loadUsers(name) {
  var params = { name: name };
  $.ajax({
    type: "GET",
    url: "/search",
    data: params,
    success: function(data) {
      $(".profile").empty().hide();
      $(".profile").append(data.content).fadeIn(500);;
    }
  });
}
;
