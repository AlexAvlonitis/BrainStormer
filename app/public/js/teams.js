$(document).ready(function(){

  function newTeamModals(title,body){
    $('#errors-modal').modal('show');
    $('.modal-title').html(title);
    $('.modal-body-content').html(body);
  }

  $('#team').click(function() {
    var form = '<form id="create-team" action="/api/teams" method="post"><div class="form-group"><label for="team-name">Name of the team</label><input name="title" type="text" class="form-control" id="team-name" placeholder="Name"></div><div class="form-group"><label for="team-description">Description</label><input name="description" type="text" class="form-control" id="team-description" placeholder="Description"></div><button id="create" type="submit" class="btn btn-default">Create</button></form>';
    newTeamModals("Create a new Team", form);

    $('form#create-team').submit(function(e) {
      e.preventDefault();
      var formData = JSON.stringify($("form#create-team").serializeObject());

      $.ajax({
        type: "POST",
        url: "/api/teams",
        data: formData,
        success: function(data){
          location.reload();
        },
        error: function(){
          alert("Create error, Ops something went wrong");
        },
        dataType: "json",
        contentType : "application/json"
      });
    });
  });

    $('#idea').click(function() {
      var form = '<form id="create-idea" action="/api/ideas" method="post"><div class="form-group"><label for="idea-name">Title of the idea</label><input name="title" type="text" class="form-control" id="idea-name" placeholder="Title"></div><div class="form-group"><label for="idea-description">Description</label><input name="description" type="text" class="form-control" id="idea-description" placeholder="Description"></div><button id="create" type="submit" class="btn btn-default">Create</button></form>';
      newTeamModals("Write your Idea", form);

      $('form#create-idea').submit(function(e) {
        e.preventDefault();
        var formData = JSON.stringify($("form#create-idea").serializeObject());

        $.ajax({
          type: "POST",
          url: "/api/ideas",
          data: formData,
          success: function(data){
            location.reload();
          },
          error: function(){
            alert("Create error, Ops something went wrong");
          },
          dataType: "json",
          contentType : "application/json"
        });
      });
    });

  $.getJSON( "/api/teams", function( data ) {
    var html = "";
    $.each( data, function( key, value ) {
      html += '<div class="card">';
      html += '<div class="card-header">' + '<h2>' + value.title + '</h2>' + '</div>';
      html += '<div class="card-body">' + '<p>' + value.description + '</p>' ;
      html += '<a href="/teams/' + value.id + '">' + "Details" + '</a>' + '</div>';
      html += '</div>';
    });
    $("#teams.row").append(html);
  });

});
