$(document).ready(function(){

  function newTeamModals(title,body){
    $('#errors-modal').modal('show');
    $('.modal-title').html(title);
    $('.modal-body-content').html(body);
  }

  $('#team').click(function() {
    var form = "";
    form += '<form id="create-team" action="/api/teams" method="post">';
    form += '<div class="form-group">';
    form += '<label for="team-name">Name of the team</label>';
    form += '<input name="title" type="text" class="form-control" id="team-name" placeholder="Name"></div>';
    form += '<div class="form-group">';
    form += '<label for="team-description">Description</label>';
    form += '<input name="description" type="text" class="form-control" id="team-description" placeholder="Description"></div>';
    form += '<button id="create" type="submit" class="btn btn-default">Create</button>';
    form += '</form>';
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
      var form = "";
      var windowPath = window.location.pathname;
      var idMatch = windowPath.match(/\d+/);

      form += '<form id="create-idea" action="/api/ideas" method="post">';
      form += '<div class="form-group">';
      form += '<input type="hidden", name="id", value=' + idMatch[0] + '>';
      form += '<label for="idea-name">Title of the idea</label>';
      form += '<input name="title" type="text" class="form-control" id="idea-name" placeholder="Title"></div>';
      form += '<div class="form-group">';
      form += '<label for="idea-description">Description</label>';
      form += '<input name="description" type="text" class="form-control" id="idea-description" placeholder="Description">';
      form += '</div><button id="create" type="submit" class="btn btn-default">Create</button>';
      form += '</form>';

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

  $('#join-team').submit(function(e) {
    e.preventDefault();
    var formData = JSON.stringify($("#join-team").serializeObject());

    $.ajax({
      type: "POST",
      url: "/api/teams/join",
      data: formData,
      success: function(data){
        location.reload();
      },
      error: function(){
        newTeamModals("Ops something went wrong");
      },
      dataType: "json",
      contentType : "application/json"
    });
  });

  $('.upvote').click(function(e) {
    e.preventDefault();

    var ideaId = this.id;
    var formData = JSON.stringify({"id" : ideaId});
    var url= "/api/ideas/" + ideaId;

    $.ajax({
      type: "PUT",
      url: url,
      data: formData,
      success: function(data){
        $(".upvote" + ideaId).html(data.upvote);
      },
      error: function(){
        newTeamModals("Ops something went wrong");
      },
      dataType: "json",
      contentType : "application/json"
    });
  });

  $(".upvote").hover(function(){
    $(".upvote").attr('title', 'You can only vote once');
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
