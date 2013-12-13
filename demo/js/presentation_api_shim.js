function presentationApi() {
}

presentationApi.prototype.tryOpen = function(url, resolve, reject) {
    presentationWindow = window.open(url, "", "presentation");
    if (presentationWindow)
	resolve(presentationWindow);
    else
	reject();
}

presentationApi.prototype.requestShow = function(url) {
    var that = this;
    function tryOpenWithUrl(resolve, reject) {
	that.tryOpen(url, resolve, reject);
    }
    return new Promise(tryOpenWithUrl);
}

navigator.presentation = new presentationApi();
