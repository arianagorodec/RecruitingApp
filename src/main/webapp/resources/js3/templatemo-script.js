/*
 *	www.templatemo.com
 *******************************************************/

/* HTML document is loaded. DOM is ready. 
-----------------------------------------*/
$(document).ready(function(){

	/* Mobile menu */
	$('.mobile-menu-icon').click(function(){
		$('.templatemo-left-nav').slideToggle();				
	});

	/* Close the widget when clicked on close button */
	$('.templatemo-content-widget .fa-times').click(function(){
		$(this).parent().slideUp(function(){
			$(this).hide();
		});
	});
});

 window.onload = function () {
 CanvasJS.addColorSet("greenShades",
                [//colorSet Array

                "#4fab40"
                             
                ]);

var options = {
  exportEnabled: true,
  animationEnabled: true,
  colorSet: "greenShades",
  title: {
    
  },
  data: [
  {
    type: "splineArea",
    dataPoints: [
      { y: 680 },
      { y: 920 },
      { y: 1100 },
      { y: 870 },
      { y: 1000 },
      { y: 1213 },
      { y: 1300 },
      { y: 1284 },
      { y: 998 },
      { y: 1370 },
      { y: 1100 },
      { y: 970 },
      { y: 1000 }

    ]
  }
  ]
};
$("#chartContainer").CanvasJSChart(options);

}






function viewGraph(){
$('.column').css('height','0');
$('table tr').each(function(index) {
var ha = $(this).children('td').eq(1).text();
$('#col'+index).animate({height: ha}, 1500).html("<div>"+ha+"</div>");
});
}
$(document).ready(function(){
viewGraph();
});

function viewGraph2(){
$('.column2').css('height','0');
$('table tr').each(function(index) {
var ha = $(this).children('td').eq(1).text();
$('#col'+index).animate({height: ha}, 1500).html("<div>"+ha+"</div>");
});
}
$(document).ready(function(){
viewGraph2();
});

function viewGraph3(){
$('.column3').css('height','0');
$('table tr').each(function(index) {
var ha = $(this).children('td').eq(1).text();
$('#col'+index).animate({height: ha}, 1500).html("<div>"+ha+"</div>");
});
}
$(document).ready(function(){
viewGraph3();
});


function viewGraph4(){
$('.column4').css('height','0');
$('table tr').each(function(index) {
var ha = $(this).children('td').eq(1).text();
$('#col'+index).animate({height: ha}, 1500).html("<div>"+ha+"</div>");
});
}
$(document).ready(function(){
viewGraph4();
});