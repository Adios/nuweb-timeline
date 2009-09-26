(function() {
	var tl,
		resizeTimer = null;

	window.onload = function() {
		var element = document.getElementById('timeline'),
			eventSource = new Timeline.DefaultEventSource(),
			bandInfos = [
				Timeline.createBandInfo({
					eventSource:	eventSource,
					width:		'60%',
					intervalUnit:	Timeline.DateTime.WEEK,
					intervalPixels: 400,
					timeZone:	8
				}),
				Timeline.createBandInfo({
					eventSource:	eventSource,
					width:		'30%',
					intervalUnit:	Timeline.DateTime.MONTH,
					intervalPixels:	300,
					timeZone:	8
				}),
				Timeline.createBandInfo({
					overview:	true,
					eventSource:	eventSource,
					width:		'10%',
					intervalUnit:	Timeline.DateTime.YEAR,
					intervalPixels: 200,
					timeZone:	8
				})
			];

		bandInfos[1].syncWith = 0;
		bandInfos[2].syncWith = 1;
		bandInfos[1].highlight = true;
		bandInfos[2].highlight = true;

		tl = Timeline.create(element, bandInfos);
		Timeline.loadJSON('sources.php', function(json, url) {
				eventSource.loadJSON(json, url);
		});
	}

	window.onresize = function() {
		if (resizeTimer == null) {
			resizeTimer = window.setTimeout(function() {
				resizeTimer = null;
				tl.layout();
			}, 500);
		}
	}
})();

// vim:ts=4 sts=4 sw=4 noet:
