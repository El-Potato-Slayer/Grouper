document.addEventListener('turbolinks:load', () => {  
  const clickButton = document.getElementById("nav-btn");
  let target = document.getElementById("nav-links")
  clickButton.addEventListener("click", function () {
    $(target).animate({
      height:"toggle"
    })
  });

  $(function() {
    $('#pictureInput').on('change', function(event) {
      var files = event.target.files;
      var image = files[0]
      var reader = new FileReader();
      reader.onload = function(file) {
        var img = new Image();
        console.log(file);
        img.src = file.target.result;
        $('#target').html(img);
      }
      reader.readAsDataURL(image);
      console.log(files);
    });
  });
});