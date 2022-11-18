$('select[data-value]').each(function(index, el) {

	const $el = $(el);

	const defaultValue = $el.attr('data-value').trim();

	if (defaultValue.length > 0) {
		$el.val(defaultValue);
	}

});

$('.Popup').click(function(){
	$('.layer').show();
	$('.layer-bg').show();
});

$('.close-btn').click(function() {
	$('.layer').hide();
	$('.layer-bg').hide();
	//	$('.layer').css('display', 'none');
});