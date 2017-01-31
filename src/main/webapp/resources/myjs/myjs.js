function myjs(){
	//네비게이션 드롭다운
	$(".dropdown-toggle").hover(function() {  
		$(this).parent().find(".dropdown-menu").fadeIn('fast').show(); 
		$(this).parent().hover(function() {
		}, function(){  
		   		$(this).parent().find(".dropdown-menu").fadeOut('fast'); 
		   });  
	});
};
function addComma(num) {
	return Number(num).toLocaleString('en');
};
