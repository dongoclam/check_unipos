$(document).ready(function(){$("body").on("click",".btn-new-setting",function(){$(".modal-form .modal-title").html("New Setting"),$.ajax({url:"/admin/settings/new",type:"GET",dataType:"json",success:function(t){$(".modal-body").html(t.content),$(".modal-form").modal()}})}),$("body").on("click",".btn-submit",function(){var t=$(".form").attr("action"),e=$(".form").serialize(),n=$(".form").attr("method");$.ajax({type:n,url:t,data:e,success:function(t){if("success"==t.status){if(t.setting_id){var e=$('tr[setting_id="'+t.setting_id+'"]');$(t.content).insertAfter(e),e.remove()}else $(".table").append(t.content);$(".modal-form").modal("toggle")}else $(".message").html(t.message),setTimeout(function(){$(".message .alert").fadeOut(500)},2e3)}})}),$("body").on("click",".btn-edit-setting",function(){$(".modal-form .modal-title").html("Edit Setting");var t="settings/"+$(this).parent().parent().attr("setting_id")+"/edit";$.ajax({type:"GET",url:t,success:function(t){"success"==t.status&&($(".modal-body").html(t.content),$(".modal-form").modal())}})}),$("body").on("click",".btn-delete-setting",function(){settingId=$(this).parent().parent().attr("setting_id"),$(".btn-delete-data-confirm").attr("setting_id",settingId),$(".modal-confirm").modal()}),$("body").on("click",".btn-delete-data-confirm",function(){settingId=$(this).attr("setting_id"),$.ajax({type:"DELETE",url:"settings/"+settingId,success:function(t){"success"==t.status&&($('tr[setting_id="'+settingId+'"]').hide("slow"),$(".modal-confirm").modal("toggle"))}})})});