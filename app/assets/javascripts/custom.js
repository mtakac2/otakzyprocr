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
});
