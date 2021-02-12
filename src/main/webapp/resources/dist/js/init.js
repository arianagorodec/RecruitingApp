/** *************Init JS*********************
	
    TABLE OF CONTENTS
	---------------------------
	1.Ready function
	2.Load function
	3.Full height function
	4.doodle function
	5.Chat App function
	6.Resize function
 ** ***************************************/
 
 "use strict"; 
/*****Ready function start*****/
/*****Ready function end*****/

/*****Load function start*****/
$(window).load(function(){
	$(".preloader-it").delay(500).fadeOut("slow");
	/*Progress Bar Animation*/
	var progressAnim = $('.progress-anim');
	if( progressAnim.length > 0 ){
		for(var i = 0; i < progressAnim.length; i++){
			var $this = $(progressAnim[i]);
			$this.waypoint(function() {
			var progressBar = $(".progress-anim .progress-bar");
			for(var i = 0; i < progressBar.length; i++){
				$this = $(progressBar[i]);
				$this.css("width", $this.attr("aria-valuenow") + "%");
			}
			}, {
			  triggerOnce: true,
			  offset: 'bottom-in-view'
			});
		}
	}
});
/*****Load function* end*****/

/***** Full height function start *****/

/***** Full height function end *****/

/***** doodle function start *****/
