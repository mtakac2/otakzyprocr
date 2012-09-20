$(document).ready(function($) {
  
  // START info window
  $(function(){
    var link = $('g>a');
    link.live('mouseover', function(e) {
      var x = e.pageX;
      var y = e.pageY;

      var titleValue = $(this).attr("title");
      var titleValue = titleValue.split(',');
      var count = titleValue.length;
      var qNames = new Array();
  
      for(var i=0;i<a;i++)
      {
        //var k = i+1;
        qNames[i] = questions[i+1].q_name;
      }
  
      $('#infoHead').append('<h3>Okres: ' + titleValue[count-1] + '</h3>');
  
      for(var i=0;i<count-1;i++)
      {
        $('#infoHead').append('<p>' + qNames[i] + ': ' + titleValue[i] + '</p>');
      }
  
      $('#infoHead').css('display',"inline");
      //$('#infoHead').css('height',"150px");
      $('#infoHead').css('position',"absolute");
      $('#infoHead').css('left',x+10);
      $('#infoHead').css('top',y+5);
      return false;
    })
  })
      
  $(function(){
    $('a').live('mouseout', function() {
      $('#infoHead').css('display',"block");
      $('#infoHead').css('position',"fixed");
      //$('#infoHead').css('height',0);
      $('#infoHead').css('left',-200);
      $('#infoHead').css('top',-200);
      $('#infoHead').empty();
      return false;
    })
  })
  // END info window
});