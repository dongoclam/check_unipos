$(document).ready(function() {
  $(".load-user-from-unipos").click(function() {
    $(".img-done").attr("src", "").css("display", "none");
    $(".img-loading").attr("src", "/assets/loading.gif").fadeIn(200);
    $(".loading-panel").modal();
    $.ajax({
      type: "POST",
      url: "users/",
      success: function() {
        $(".img-loading").fadeOut(0);
        $(".img-done").attr("src", "/assets/checkmark.gif").fadeIn(300);
        setTimeout(function(){$(".loading-panel").modal("toggle"); }, 1800);
      }
    });
  });

  $(".update-user-information").click(function() {
    $(".img-done").attr("src", "").css("display", "none");
    $(".img-loading").attr("src", "/assets/loading.gif").fadeIn(200);
    $(".loading-panel").modal();
    $.ajax({
      type: "PUT",
      url: "users/",
      success: function() {
        $(".img-loading").fadeOut(0);
        $(".img-done").attr("src", "/assets/checkmark.gif").fadeIn(300);
        setTimeout(function(){$(".loading-panel").modal("toggle"); }, 1800);
      }
    });
  });

  $(".show-user").click(function() {
    $.ajax({
      type: "GET",
      url: "users/" + $(this).attr("user_id"),
      success: function(data) {
        $(".user-avatar").attr("src", data.avatar);
        $(".user-name").html(data.name);
        $(".user-account-name").html(data.unipos_name);
        $(".user-info").attr("href", "/users/" + data.id);
        $(".user-detail").modal();
      }
    });
  });

  $(".btn-delete-user").click(function() {
    $(".btn-delete-data-confirm").attr("user_id", $(this).attr("user_id"));
    $(".modal-confirm").modal();
  });

  $(".btn-delete-data-confirm").click(function() {
    userId = $(this).attr("user_id");
    $.ajax({
      type: "DELETE",
      url: "users/" + userId,
      success: function() {
        $("img[user_id=\"" + userId + "\"]").parent().parent().hide("slow");
        $(".modal-confirm").modal("toggle");
      }
    });
  });
});
