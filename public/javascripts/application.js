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
});