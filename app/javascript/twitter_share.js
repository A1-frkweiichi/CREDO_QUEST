window.tweet = function (element) {
  var text = element.getAttribute("data-text");
  var url = element.getAttribute("data-url") || window.location.href;
  var hashtags = "CREDO_QUEST,RUNTEQ";
  var via = "CREDO_QUEST";
  var tweetUrl =
    "https://twitter.com/share?url=" +
    encodeURIComponent(url) +
    "&text=" +
    encodeURIComponent(text) +
    "&via=" +
    encodeURIComponent(via) +
    "&hashtags=" +
    encodeURIComponent(hashtags);
  window.open(tweetUrl);
};
