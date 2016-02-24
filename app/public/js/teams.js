$(document).ready(function(){

  function newTeamModals(title,body){
    $('#errors-modal').modal('show');
    $('.modal-title').html("Create a new Team");
    $('.modal-body-content').html(body);
  }

  $('#team').click(function() {
    var form = '<form id="create-team" action="/api/teams" method="post"><div class="form-group"><label for="team-name">Name of the team</label><input name="name" type="text" class="form-control" id="team-name" placeholder="Name"></div><button id="create" type="submit" class="btn btn-default">Create</button></form>';
    newTeamModals("Login error", form);

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
          alert("Create error, You can't have more than one team");
        },
        dataType: "json",
        contentType : "application/json"
      });
    });

  });


});
