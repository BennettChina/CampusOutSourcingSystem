$(function() {
	let name = $('#zone span').text().trim();
	$("select.select option:contains('" + name + "')").prop("selected", true);
	$(".select").change(function() {
		let str = $('select.select option:selected').val();
		let info = $('select.select option:selected').text();
		switch (str) {
		case 'lh':
		case 'ry':
		case 'bx':
		case 'zx':
			window.location.href = "./findByrName?rName=" + info;
		}
	});
})