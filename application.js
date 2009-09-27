(function() {
	var tl,
		resizeTimer = null,
		theme = (function() {
			var theme = Timeline.ClassicTheme.create();
			theme.event.instant.iconWidth = 16;
			theme.event.instant.iconHeight = 16;
			theme.event.track.height = 16;
			return theme;
		})();

	window.onload = function() {
		var element = document.getElementById('timeline'),
			eventSource = new Timeline.DefaultEventSource(),
			bandInfos = [
				Timeline.createBandInfo({
					eventSource:	eventSource,
					width:		'60%',
					intervalUnit:	Timeline.DateTime.WEEK,
					intervalPixels: 400,
					timeZone:	8,
					theme:		theme
				}),
				Timeline.createBandInfo({
					eventSource:	eventSource,
					width:		'30%',
					intervalUnit:	Timeline.DateTime.MONTH,
					intervalPixels:	300,
					timeZone:	8,
					theme:		theme
				}),
				Timeline.createBandInfo({
					eventSource:	eventSource,
					width:		'10%',
					intervalUnit:	Timeline.DateTime.YEAR,
					intervalPixels: 200,
					timeZone:	8,
					theme:		theme,
					layout:		'overview'
				})
			];

		bandInfos[1].syncWith = 0;
		bandInfos[2].syncWith = 1;
		bandInfos[1].highlight = true;
		bandInfos[2].highlight = true;

		tl = Timeline.create(element, bandInfos);
		Timeline.loadJSON('sources.php', function(json, url) {
				imagePreload(json);
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

	function imagePreload(json) {
		var frag = document.createDocumentFragment();

		for (var i = 0, len = json.events.length; i < len; i++) {
			var img = new Image;
			img.style.display = 'none';
			img.src = json.events[i].image;
			frag.appendChild(img);
		}

		document.body.appendChild(frag);
	}
})();

// vim:ts=4 sts=4 sw=4 noet:
