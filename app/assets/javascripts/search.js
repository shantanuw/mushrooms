var jQ = jQuery.noConflict();

jQ(document).ready(function() {
	jQ("#submit").click(searchMushrooms);
	jQ("#nameSB").keyup(nameSuggest);
	jQ("#colorSB").keyup(colorSuggest);
	jQ("#typeSB").keyup(typeSuggest);
	jQ(document).click(hideAllSuggestions);
});

function searchMushrooms() {
	
	var name = jQ("#nameSB").val();
	var color = jQ("#colorSB").val();
	var type = jQ("#typeSB").val();
	var poison = jQ('input[name=poisonousRB]:checked').val();
	
	var q = "name=" + name + "&color=" + color + "&type=" + type;
	if (poison != undefined) q += "&poisonous=" + poison;
	//alert(q);
	
	jQ.ajax({
		url: '/searchmushroom.json',
		dataType: 'json',
		data: q,
		success: successCb
	});
	
	return false;
}

function successCb (result) {

	if (result == "") jQ("#result").text("No Matching results found");
	else {
		jQ("#result").text("");
		var html = "<table><thead><th>Name</th><th>Color</th><th>Type</th><th>Poisonous</th></thead><tbody>";
		jQ.each(result, function(key, val) {
			html += "<tr><td><a href='/mushrooms/" + val.id + "'>" + val.name + "</a></td><td>" + val.color + "</td><td>" + val.mushroom_type + "</td><td>" + val.poisonous + "</td></tr>";
		});
		html += "</tbody></table>"
		
		jQ(html).appendTo("#result");
	}
}

function nameSuggest() {
	var name = jQ("#nameSB").val();
	jQ.ajax({
		url: '/searchmushroom.json',
		dataType: 'json',
		data: "name=" + name,
		success: function(res) {
			jQ("#name_suggest").text("");
			var arr = new Array();
			var suggest = "";
			jQ.each(res, function(key, val) {
				if (jQ.inArray(val.name, arr) === -1) {
                        arr.push(val.name);
                }
			});
			for (var v in arr) {
				suggest = '<div onmouseover="suggestOver(this);" ';
				suggest += 'onmouseout="suggestOut(this);" ';
				suggest += 'onclick="suggestSelectionName(this);" ';
				suggest += 'class="suggest_link">' + arr[v] + '</div>';
				jQ(suggest).appendTo("#name_suggest");
			}
			if (suggest != "") jQ('#name_suggest').slideDown();
		}
	});
}

function colorSuggest() {
	var color = jQ("#colorSB").val();
	jQ.ajax({
		url: '/searchmushroom.json',
		dataType: 'json',
		data: "color=" + color,
		success: function(res) {
			jQ("#color_suggest").text("");
			var arr = new Array();
			var suggest = "";
			jQ.each(res, function(key, val) {
				if (jQ.inArray(val.color, arr) === -1) {
                        arr.push(val.color);
                }
			});
			for (var v in arr) {
				suggest = '<div onmouseover="suggestOver(this);" ';
				suggest += 'onmouseout="suggestOut(this);" ';
				suggest += 'onclick="suggestSelectionColor(this);" ';
				suggest += 'class="suggest_link">' + arr[v] + '</div>';
				jQ(suggest).appendTo("#color_suggest");
			}
			if (suggest != "") jQ('#color_suggest').slideDown();
		}
	});
}

function typeSuggest() {
	var type = jQ("#typeSB").val();
	jQ.ajax({
		url: '/searchmushroom.json',
		dataType: 'json',
		data: "type=" + type,
		success: function(res) {
			jQ("#type_suggest").text("");
			var arr = new Array();
			var suggest = "";
			jQ.each(res, function(key, val) {
				if (jQ.inArray(val.mushroom_type, arr) === -1) {
                        arr.push(val.mushroom_type);
                }
			});
			for (var v in arr) {
				suggest = '<div onmouseover="suggestOver(this);" ';
				suggest += 'onmouseout="suggestOut(this);" ';
				suggest += 'onclick="suggestSelectionType(this);" ';
				suggest += 'class="suggest_link">' + arr[v] + '</div>';
				jQ(suggest).appendTo("#type_suggest");
			}
			if (suggest != "") jQ('#type_suggest').slideDown();
		}
	});
}

function suggestOver(obj) {
	obj.className = 'suggest_link_over';
}

function suggestOut(obj) {
	obj.className = 'suggest_link';
}

function suggestSelectionName(obj) {
	jQ("#nameSB").val(obj.innerHTML);
}

function suggestSelectionColor(obj) {
	jQ("#colorSB").val(obj.innerHTML);
}

function suggestSelectionType(obj) {
	jQ("#typeSB").val(obj.innerHTML);
}

function hideAllSuggestions() {
	jQ(".suggestBox").hide();
}