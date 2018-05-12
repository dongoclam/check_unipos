$(document).ready(function() {
  $("#clone-chatwork-users").click(function() {
    $(".img-done").attr("src", "").css("display", "none");
    $(".img-loading").attr("src", "/assets/loading.gif").fadeIn(200);
    $(".loading-panel").modal();
    $.ajax({
      type: "GET",
      url: ADMIN_CLONES_CHATWORK_USERS_PATH,
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
      url: ADMIN_CHATWORK_USERS_PATH + $(this).attr("user_id"),
      success: function(data) {
        $(".user-avatar").attr("src", data.avatar);
        $(".user-name").html(data.name);
        $(".user-department").html(data.department);
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
      url: ADMIN_CHATWORK_USERS_PATH + userId,
      success: function() {
        $("img[user_id=\"" + userId + "\"]").parent().parent().hide("slow");
        $(".modal-confirm").modal("toggle");
      }
    });
  });
});
