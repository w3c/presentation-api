function scaleVideoHeight() {
    mainVid = document.getElementById("mainvid");
    var width = mainVid.parentElement.offsetWidth;
    videojs("mainvid").width(width).height( width * 9 / 16);
}

addEventListener("load", scaleVideoHeight );
addEventListener("resize", scaleVideoHeight );

