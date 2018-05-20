$(document).ready(function() {
  $("body").on("click", "#new-tag", function() {
    $(".modal-form .modal-title").html("New Tag");
    $.ajax({
      url: ADMIN_NEW_TAG_PATH,
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
          if(data.tag_id) {
            var tag = $("tr[tag_id=\"" + data.tag_id + "\"]");
            $(data.content).insertAfter(tag);
            tag.remove();
          } else {
            $(".table").append(data.content);
          }
          $(".modal-form").modal("toggle");
        } else {
          $(".modal-body").prepend(data.message);
          setTimeout(function() {
            $(".message .alert").fadeOut(500)
          }, 2000);
        }
      }
    });
  });

  $("body").on("click", ".btn-edit-tag", function() {
    $(".modal-form .modal-title").html("Edit Tag");
    var url = ADMIN_TAGS_PATH + $(this).parent().parent().attr("tag_id") + "/edit";
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

  $("body").on("click", ".btn-delete-tag", function() {
    tagId = $(this).parent().parent().attr("tag_id");
    $(".btn-delete-data-confirm").attr("tag_id", tagId);
    $(".modal-confirm").modal();
  });

  $("body").on("click", ".btn-delete-data-confirm", function() {
    tagId = $(this).attr("tag_id");
    $.ajax({
      type: "DELETE",
      url: ADMIN_TAGS_PATH + tagId,
      success: function(data) {
        if (data.status == "success") {
          $("tr[tag_id=\"" + tagId + "\"]").hide("slow");
          $(".modal-confirm").modal("toggle");
        }
      }
    });
  });
});
