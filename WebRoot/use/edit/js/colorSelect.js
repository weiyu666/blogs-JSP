////////////////////////////////////////////////////////////////////////////////
///Ãû³Æ£º¶àÃ½ÐÝ±à¼­Æ÷
///ÍøÖ·£ºhttp://www.avpx.net
///Edit By Mal
////////////////////////////////////////////////////////////////////////////////
// ÑÕÉ«¶¨Òå
var s = "";
var hex = new Array(6)
// assign non-dithered descriptors
hex[0] = "FF"
hex[1] = "CC"
hex[2] = "99"
hex[3] = "66"
hex[4] = "33"
hex[5] = "00"
// draw a single table cell based on all descriptors
function drawCell(red, green, blue) {
	// open cell with specified hexadecimal triplet background color
	var color = '#' + red + green + blue;
	if(color == "#000066") color = "#000000";
	s += '<TD BGCOLOR="' + color + '" style="height:12px;width:12px;" >';
	// print transparent image (use any height and width)
	s += '<IMG '+ ((document.all)?"":"src='place.gif'") +' HEIGHT=12 WIDTH=12>';
	// close table cell
	s += '</TD>';
}
// draw table row based on red and blue descriptors
function drawRow(red, blue) {
	// open table row
	s += '<TR>';

	// loop through all non-dithered color descripters as green hex
	for (var i = 0; i < 6; ++i) {
		drawCell(red, hex[i], blue)
	}
	// close current table row
	s += '</TR>';
}
// draw table for one of six color cube panels
function drawTable(blue) {
	// open table (one of six cube panels)
	s += '<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0>';
	// loop through all non-dithered color descripters as red hex
	for (var i = 0; i < 6; ++i) {
		drawRow(hex[i], blue)
	}
	// close current table
	s += '</TABLE>';
}
// draw all cube panels inside table cells
function drawCube() {
	// open table
	s += '<TABLE CELLPADDING=0 CELLSPACING=0 style="border:1px #888888 solid"><TR>';
	// loop through all non-dithered color descripters as blue hex
	for (var i = 0; i < 2; ++i) {
		// open table cell with white background color
		s += '<TD BGCOLOR="#FFFFFF">';
		// call function to create cube panel with hex[i] blue hex
		drawTable(hex[i])
		// close current table cell
		s += '</TD>';
	}
	s += '</TR><TR>';
	for (var i = 2; i < 4; ++i) {
		// open table cell with white background color
		s += '<TD BGCOLOR="#FFFFFF">';
		// call function to create cube panel with hex[i] blue hex
		drawTable(hex[i])
		// close current table cell
		s += '</TD>';
	}
	// close table row and table
	s += '</TR></TABLE>';
	return s;
}

