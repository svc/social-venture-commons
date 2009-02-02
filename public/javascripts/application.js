// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var editableOpts = {
	indicator: 'Saving...',
  tooltip: 'Click to edit...',
  cancel: 'Cancel',
  submit: 'OK',
	tooltip: 'Click to edit',
	cssclass: 'edit-form'
};

$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

$(document).ready(function() {
  $(".system-messages").delay(2500).hide("blind", { direction: "vertical" }, 1000);
	setMaxLength();
});

function setMaxLength() {
	var x = document.getElementsByTagName('textarea');
	var counter = document.createElement('div');
	counter.className = 'counter';
	for (var i=0;i<x.length;i++) {
		if (x[i].getAttribute('maxlength')) {
			var counterClone = counter.cloneNode(true);
			counterClone.relatedElement = x[i];
			counterClone.innerHTML = '<span>0</span>/'+x[i].getAttribute('maxlength');
			x[i].parentNode.insertBefore(counterClone,x[i].nextSibling);
			x[i].relatedElement = counterClone.getElementsByTagName('span')[0];

			x[i].onkeyup = x[i].onchange = checkMaxLength;
			x[i].onkeyup();
		}
	}
}

function checkMaxLength() {
	var maxLength = this.getAttribute('maxlength');
	var currentLength = this.value.length;
	if (currentLength > maxLength) {
		this.relatedElement.className = 'toomuch';
		$("#twitter_post").attr("disabled", true); 
	}	else {
		this.relatedElement.className = '';
		$("#twitter_post").attr("disabled", false); 
	}
	this.relatedElement.firstChild.nodeValue = currentLength;
	// not innerHTML
}
