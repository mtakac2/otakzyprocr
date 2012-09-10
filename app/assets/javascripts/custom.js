$(document).ready(function() {

  // START CAROUSEL  
  $("#carousel").carouFredSel({
    items       : 3,
    prev   : {
      button : "#prev"
    },
    next   : {
      button : "#next"
    },
    scroll : {
      items        : 1,
      pauseOnHover : true,
      mousewheel   : true
    },
    auto  : {
      pauseDuration : 60000
    }
  });

  // COMPUTE COST OF PROMISED HOURS
  $(function() {
    $('#citizens_question_hours').change(function() {
      var promisedHours = $('#citizens_question_hours').val();
      var pricePerHour = 5.00;
      var priceTotal = 0.00;

      if (promisedHours > 3 && promisedHours <= 10) {
        priceTotal = 50.00;
      } 
      else if (promisedHours > 10) { 
        priceTotal = pricePerHour * promisedHours;
      }

      $('span#price').html(priceTotal.toFixed(2));
    });
  })  
});
