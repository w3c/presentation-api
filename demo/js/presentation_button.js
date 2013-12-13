videojs.PresentationToggle = videojs.Button.extend({
    init: function(player, options){
        videojs.Button.call(this, player, options);
    }
});

videojs.PresentationToggle.prototype.onClick = function() {
    togglePresentation();
    return true;
};

var createPresentationToggleButton = function() {
    var props = {
        className: 'vjs-presentation-button vjs-control',
        innerHTML: '<div class="vjs-control-content"><span class="vjs-control-text">' + ('Toggle Presentation') + '</span></div>',
        role: 'button',
        tabIndex: 0
    };
    return videojs.Component.prototype.createEl(null, props);
};

var presentationToggle;
videojs.plugin('presentation', function() {
    var options = { 'el' : createPresentationToggleButton() };
    presentationToggle = new videojs.PresentationToggle(this, options);
    controlBarEl = this.controlBar.el();
    controlBarEl.appendChild(presentationToggle.el());
});

var presentationWindow;
function togglePresentation() {
    if (presentationWindow) {
        videojs("mainvid").currentTime( presentationWindow.currentTime() ).play();
	presentationWindow.close();
        presentationWindow = null;
    } else {
        videojs("mainvid").pause();
	navigator.presentation.requestShow("player.html#" + videojs("mainvid").currentTime()).then(
	    function(presWindow) {
		presentationWindow = presWindow;
	});
    }
}

function onPresentationWindowClosing(playtime) {
    presentationWindow = null;
    videojs("mainvid").currentTime(playtime).play();
}