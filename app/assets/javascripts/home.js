var typingTimer;

$(document).on("keyup", ".search", function(event) {
  clearTimeout(typingTimer);
  if(isRealCharacterTyping(event)) {
    var name = $(this).val();
    typingTimer = setTimeout(function() {
      loadUsers(name);
    }, 500);
  }
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

function isRealCharacterTyping(event) {
  regex = /[a-z ]/i;
  return regex.test(String.fromCharCode(event.keyCode)) || event.keyCode == 13;
}
