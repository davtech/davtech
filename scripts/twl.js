$(document).ready(function(){
	 $(".seemore_body").hide();
	 $('.seemore').click(function(){
		$(this).parent().next(".seemore_body").slideToggle(600);
	 });
	 $(".seemore_body").click(function(){
		$(this).slideUp(600);
	 });
	 $('.project img').click(function(){
		 $(this).parent().next().next(".seemore_body").slideToggle(600);
	 });
});