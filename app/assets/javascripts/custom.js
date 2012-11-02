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
      pauseDuration : 20000
    }
  });

  // COMPUTE COST OF PROMISED HOURS
  $(function() {
    $('#citizens_question_hours').change(function() {
      var promisedHours = $('#citizens_question_hours').val();
      var pricePerHour = 0.00;
      var priceTotal = 0.00;

      if (promisedHours > 3) {
                
        switch(promisedHours) {
          case "4": pricePerHour = 12.50;            
          break;
          case "5": pricePerHour = 10.00;
          break;
          case "6": pricePerHour = 8.50;
          break;
          case "7": pricePerHour = 7.50;
          break;
          case "8": pricePerHour = 6.50;
          break;
          case "9": pricePerHour = 6.00;
          break;
          default: pricePerHour = 5.00;
        }        
      } 
      
      priceTotal = pricePerHour * promisedHours;      

      $('span#price').html(priceTotal.toFixed(2));
    });
  })  
});

$('.dropdown-toggle').dropdown()