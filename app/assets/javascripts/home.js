$(document).ready(function() {
  $(".btn-search").click(function(e) {
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/search",
      data: {name: $(".search-input").val()},
      success: function(data) {
        $(".profile").html("");
        for (var i = 0; i < data.length; i++) {
          html =  '<div class="col-md-3 text-center">'
          html +=   '<div class="avatar">';
          html +=     '<img class="user-avatar img-raised rounded-circle img-fluid img-md" alt="Circle Image" src=' + data[i].avatar + '>';
          html +=   '</div>';
          html +=   '<div class="name">';
          html +=     '<h4>' + data[i].name + '</h4>';
          html +=     '<h6 class="user-account-name">' + data[i].unipos_name + '</h6>';
          html +=   '</div>';
          html += '</div>';
          $(".profile").append(html).slow();
        }
      }
    });
  });
});
