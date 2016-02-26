$(document).ready(function(){

  function errorModals(title,body){
    $('#errors-modal').modal('show');
    $('.modal-title').html(title);
    $('.modal-body-content').html(body);
  }

  $('#login').submit(function(e) {
    e.preventDefault();
    var formData = JSON.stringify($("#login").serializeObject());

    $.ajax({
      type: "POST",
      url: "/login",
      data: formData,
      success: function(data){
        window.location='/';
      },
      error: function(){
        errorModals("Login error", "Wrong Username or Password");
      },
      dataType: "json",
      contentType : "application/json"
    });
  });

  $('#register').submit(function(e) {
    e.preventDefault();
    var formData = JSON.stringify($("#register").serializeObject());

    $.ajax({
      type: "POST",
      url: "/api/users",
      data: formData,
      success: function(data){
        window.location='/';
      },
      error: function(){
        errorModals("SignUp Error", "Wrong Input or Email already exists");
      },
      dataType: "json",
      contentType : "application/json"
    });
  });

  $('#logout').submit(function(e) {
    e.preventDefault();
    var formData = JSON.stringify($("#logout").serializeObject());

    $.ajax({
      type: "DELETE",
      url: "/logout",
      data: formData,
      success: function(data){
        window.location='/';
      },
      error: function(){
        errorModals("Logout error", "Ops, something went wrong");
      },
      dataType: "json",
      contentType : "application/json"
    });
  });

});
