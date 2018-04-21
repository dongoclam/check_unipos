$(document).ready(function() {
  $(".btn-search").click(function(e) {
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: "/search",
      data: {name: $(".search").val()},
      success: function(data) {
        $(".profile").html("").css('display', 'none');

        if (typeof data == "object") {
          if (data.length == 0) {
            html = '<h3 class="ml-auto mr-auto search-message">We Couldn\'t find anything :(</h3>';
            $(".profile").append(html).fadeIn(1000);
            return;
          }

          for (var i = 0; i < data.length; i++) {
            html  = '<div class="col-md-3 text-center search-result-item">'
            html +=   '<div class="avatar">';
            html +=     '<a href="/users/' + data[i].id + '">'
            html +=       '<img class="user-avatar img-raised rounded-circle img-fluid img-md" alt="Circle Image" src=' + data[i].avatar + '>';
            html +=     '</a>'
            html +=   '</div>';
            html +=   '<div class="name">';
            html +=     '<h4>' + data[i].name + '</h4>';
            html +=     '<h6 class="user-account-name">' + data[i].unipos_name + '</h6>';
            html +=   '</div>';
            html += '</div>';
            $('.profile').append(html);
          }
          $('.profile').fadeIn(1000);
        }
        $('.profile').fadeIn(1000);
      }
    });
  });
});
