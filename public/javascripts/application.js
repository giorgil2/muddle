var show_by_id = function(id) {
	$('.form').hide();
	$('#' + id).show();
}

$(document).ready(function() {
	show_by_id($('#post_type').val());
	$('#post_type').change(function() {
		show_by_id(this.value);
	});
});