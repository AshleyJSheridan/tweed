;(function(TWEED, $){
	$(function(){
		TWEED.Queries.init();
	});
	
	TWEED.Queries = {
		init : function(){
			if($('.query').length)
			{
				
				// add query button
				$('.action.add_query').on('click', function(){
					$('.query:last').clone().appendTo('.query_fields');
					$('.query:last input[name=content\\[\\]]').attr('value', '');
					$('.query:last input[name=item_order\\[\\]]').attr('value', $('.query').length );
				});
				
				// save button
				$('.action.save').on('click', function(){
					$('form.queries').submit();
				});
			}
		}
	};
})(window.TWEED = window.TWEED || {}, jQuery);