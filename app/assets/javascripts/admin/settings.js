$(document).ready(function() {
  $('.btn-new-setting').click(function() {
    $('.alert-message').css('display', 'none');
    $('.modal-title').html('New Setting');
    $('.form').attr('action', 'settings/');
    $('.setting-key').val('');
    $('.setting-value').val('');
    $('.btn-update-setting').css('display', 'none');
    $('.btn-create-setting').css('display', 'block');
    $('.setting-detail').modal();
  });

  $('.btn-create-setting').click(function() {
    var url = $('.form').attr('action');
    var params = $('form').serialize();
    $.ajax({
      type: "POST",
      url: url,
      data: params,
      success: function(data) {
        if(data.status == 'success') {
          $('.setting-detail').modal('toggle');
          setting = data['setting'];

          html  = '<tr>'
          html +=  '<td>'+ '1' + '</td>'
          html +=  '<td>' + setting.key + '</td>'
          html +=  '<td>' + setting.value + '</td>'
          html +=  '<td>'
          html +=    '<button type="button" class="btn btn-primary btn-link btn-sm btn-edit-setting" setting_id="' + setting.id + '">'
          html +=      '<i class="material-icons">edit</i>'
          html +=    '</button>'
          html +=    '<button type="button" class="btn btn-danger btn-link btn-sm btn-delete-setting" setting_id="' + setting.id + '">'
          html +=      '<i class="material-icons">close</i>'
          html +=    '</button>'
          html +=  '</td>'
          html += '</tr>'

          $('.table').prepend(html);
        } else {
          $('.alert-message').attr('class', 'alert alert-danger alert-message');
          $('.alert-message').html('<span>' + data.message + '</span>');
          $('.alert-message').fadeIn(200);
        }
      }
    });
    $('.alert-message').css('display', 'none');
  });

  $('.btn-edit-setting').click(function() {
    $('.alert-message').css('display', 'none');
    $('.btn-update-setting').css('display', 'block');
    $('.btn-create-setting').css('display', 'none');
    var url = 'settings/' + $(this).attr('setting_id') + '/edit';
    $('.form').attr('action', 'settings/' + $(this).attr('setting_id'));
    $.ajax({
      type: 'GET',
      url: url,
      success: function(data) {
        if(data.status == 'success') {
          $('.setting-key').val(data["setting"].key);
          $('.setting-value').val(data["setting"].value);
          $('.setting-detail').modal()
        }
      }
    });
  });

  $('.btn-update-setting').click(function() {
    var url = $('.form').attr('action');
    var params = $('form').serialize();
    $.ajax({
      type: "PUT",
      url: url,
      data: params,
      success: function(data) {
        if(data.status == 'success') {
          $('.setting-detail').modal('toggle');
        } else {
          $('.alert-message').attr('class', 'alert alert-danger alert-message');
          $('.alert-message').html('<span>' + data.message + '</span>');
          $('.alert-message').fadeIn(200);
        }
      }
    });
    $('.alert-message').css('display', 'none');
  });

  $('.btn-delete-setting').click(function() {
    $('.btn-delete-data-confirm').attr('setting_id', $(this).attr('setting_id'));
    $('.modal-confirm').modal();
  });

  $('.btn-delete-data-confirm').click(function() {
    settingId = $(this).attr('setting_id');
    $.ajax({
      type: 'DELETE',
      url: 'settings/' + settingId,
      success: function() {
        $('.btn-delete-setting[setting_id="' + settingId + '"]').parent().parent().hide("slow");
        $('.modal-confirm').modal('toggle');
      }
    });
  });
});
