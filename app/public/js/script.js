$(document).ready(function(){

  $.fn.serializeObject = function()
  {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function() {
          if (o[this.name] !== undefined) {
              if (!o[this.name].push) {
                  o[this.name] = [o[this.name]];
              }
              o[this.name].push(this.value || '');
          } else {
              o[this.name] = this.value || '';
          }
      });
      return o;
  };

  $('#register').submit(function(event) {
      var formData = JSON.stringify($("#register").serializeObject());

      $.ajax({
        type: "POST",
        url: "/api/users",
        data: formData,
        success: function(){},
        dataType: "json",
        contentType : "application/json"
      });
      console.log(formData);
      event.preventDefault();
  });


});
