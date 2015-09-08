;(function(TWEED, $){
	$(function(){
		TWEED.Tweets.init();
	});
	
	TWEED.Tweets = {
		init : function(){
			
			// approve button
			$('.item_table.tweets').on('click', '.action.approve', function(e){
				e.preventDefault();
				
				var obj = this;
				var action_url  = this.href;
				
				$.ajax({
					url: action_url,
					type: "POST"
				}).success(function(data){
					if(data == 'ok')
					{
						$(obj).attr('title', 'unapprove').attr('href', obj.href.replace('approve', 'unapprove') ).removeClass('approve').addClass('unapprove')
					}
				});
			});
			
			// unapprove button
			$('.item_table.tweets').on('click', '.action.unapprove', function(e){
				e.preventDefault();
				
				var obj = this;
				var action_url  = this.href;
				
				$.ajax({
					url: action_url,
					type: "POST"
				}).success(function(data){
					if(data == 'ok')
					{
						$(obj).attr('title', 'approve').attr('href', obj.href.replace('unapprove', 'approve') ).removeClass('unapprove').addClass('approve')
					}
				});
			});
			
		}
	};
})(window.TWEED = window.TWEED || {}, jQuery);