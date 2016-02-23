$(document).ready(function(){

  $('#register').submit(function(event) {
      var formData = JSON.stringify($("#register").serializeObject());

      $.ajax({
        type: "POST",
        url: "/api/users",
        data: formData,
        success: function(){
          alert("User Created");
        },
        dataType: "json",
        contentType : "application/json"
      });
      event.preventDefault();
  });



});
