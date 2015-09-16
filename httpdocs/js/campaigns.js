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
					// don't allow queries more complex than 10, as this is a limit imposed by Twitter
					if($('.query').length < 10)
					{
						$('.query:last').clone().appendTo('.query_fields');
						$('.query:last input[name=content\\[\\]]').attr('value', '');
						$('.query:last input[name=item_order\\[\\]]').attr('value', $('.query').length );
					}
				});
				
				// save button
				$('.action.save').on('click', function(){
					$('form.queries').submit();
				});
				
				// delete button
				$('.queries').on('click', '.action.delete', function(e){
					e.preventDefault();
					
					// only allow a query to be deleted if there is at least one for a campaign
					if($('.query').length > 1)
					{
						$(this).parent().remove();
						
						// update the order for this query item
						$('.query').each(function(i){
							$('input[name=item_order\\[\\]]', $(this) ).attr('value', (i+1) );
						});
					}

				});
			}
		}
	};
})(window.TWEED = window.TWEED || {}, jQuery);