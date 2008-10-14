var show_by_id = function(id) {
	$('.form').hide();
	$('#' + id).show();
}

$(document).ready(function() {
	show_by_id($('#couchdb_type').val());
	$('#couchdb_type').change(function() {
		show_by_id(this.value);
	});
});