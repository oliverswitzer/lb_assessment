$(document).ready(function() {
  var $button = $('#start');
  var $body = $('body');
  var oddClick = true;
  var timerId;

  $button.click(function() {
    var $this = $(this);

    if(oddClick) {
      button.setActive($this);
      timerId = setInterval(function() {
        color.fetch()
      }, 3000);
    } else {
      button.setInactive($this);
      clearInterval(timerId);
    }
    oddClick = !oddClick
  });

  // utility objects
  var color = {
    fetch: function() {
      var color = this
      $.ajax({
        url: "/new-color.json",
        success: function(rgb) {
          color.set(rgb);
        }
      })
    },
    set: function(rgb) {
      $('body').css('background-color', 'rgb(' + rgb + ')')
    }
  }

  var button = {
    setActive: function(button) {
      button.addClass('active');
      button.html('Stop');
    },
    setInactive: function(button) {
      button.html('Start');
      button.removeClass('active');
    }
  }
});