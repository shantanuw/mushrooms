var jQ = jQuery.noConflict();

jQ(document).ready(function() {
	jQ("#submit").click(searchMushrooms);
});

function searchMushrooms() {
	jQ.ajax({
		url: '/searchmushroom.json',
		dataType: 'json',
		data: "name=white&color=white&type=wood&poisonous=1",
		success: successCb
	});
	
	return false;
}

function successCb (result) {

	if (result == "") jQ("#result").text("No Matching results found");
	else {
		var html = "<table><thead><th>Name</th><th>Color</th><th>Type</th><th>Poisonous</th></thead><tbody>";
		jQ.each(result, function(key, val) {
			html += "<tr><td><a href='/mushrooms/" + val.id + "'>" + val.name + "</a></td><td>" + val.color + "</td><td>" + val.mushroom_type + "</td><td>" + val.poisonous + "</td></tr>";
		});
		html += "</tbody></table>"
		
		jQ(html).appendTo("#result");
	}
	
}