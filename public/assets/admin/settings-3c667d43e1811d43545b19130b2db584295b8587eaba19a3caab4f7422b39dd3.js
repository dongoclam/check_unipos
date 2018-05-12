$(document).ready(function() {
  $("body").on("click", "#new-setting", function() {
    $(".modal-form .modal-title").html("New Setting");
    $.ajax({
      url: ADMIN_NEW_SETTING_PATH,
      type: "GET",
      dataType: "json",
      success: function(data) {
        $(".modal-body").html(data.content);
        $(".modal-form").modal();
      }
    });
  });

  $("body").on("click", ".btn-submit", function() {
    var url = $(".form").attr("action");
    var params = $(".form").serialize();
    var type = $(".form").attr("method");
    $.ajax({
      type: type,
      url: url,
      data: params,
      success: function(data) {
        if (data.status == "success") {
          if(data.setting_id) {
            var setting = $("tr[setting_id=\"" + data.setting_id + "\"]");
            $(data.content).insertAfter(setting);
            setting.remove();
          } else {
            $(".table").append(data.content);
          }
          $(".modal-form").modal("toggle");
        } else {
          $(".message").html(data.message);
          setTimeout(function() {
            $(".message .alert").fadeOut(500)
          }, 2000);
        }
      }
    });
  });

  $("body").on("click", ".btn-edit-setting", function() {
    $(".modal-form .modal-title").html("Edit Setting");
    var url = ADMIN_SETTINGS_PATH + $(this).parent().parent().attr("setting_id") + "/edit";
    $.ajax({
      type: "GET",
      url: url,
      success: function(data) {
        if (data.status == "success") {
          $(".modal-body").html(data.content);
          $(".modal-form").modal();
        }
      }
    });
  });

  $("body").on("click", ".btn-delete-setting", function() {
    settingId = $(this).parent().parent().attr("setting_id");
    $(".btn-delete-data-confirm").attr("setting_id", settingId);
    $(".modal-confirm").modal();
  });

  $("body").on("click", ".btn-delete-data-confirm", function() {
    settingId = $(this).attr("setting_id");
    $.ajax({
      type: "DELETE",
      url: ADMIN_SETTINGS_PATH + settingId,
      success: function(data) {
        if (data.status == "success") {
          $("tr[setting_id=\"" + settingId + "\"]").hide("slow");
          $(".modal-confirm").modal("toggle");
        }
      }
    });
  });
});
