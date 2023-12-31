(function(a_, i_, r_, _b, _r, _i, _d, _g, _e) {
  if (!a_[_b]) {
    var m = function() {
        var c = i_.createElement(r_);
        c.onerror = function() {
          f.queue
            .filter(function(b) {
              return 0 <= _d.indexOf(b[0]);
            })
            .forEach(function(b) {
              b = b[1];
              b = b[b.length - 1];
              "function" === typeof b && b("error occur when load airbridge");
            });
        };
        c.async = 1;
        c.src = _r;
        "complete" === i_.readyState
          ? i_.head.appendChild(c)
          : i_.addEventListener("readystatechange", function g() {
              "complete" === i_.readyState &&
                (
                  i_.removeEventListener("readystatechange", g),
                  i_.head.appendChild(c)
                );
            });
      },
      f = {
        queue: [],
        get isSDKEnabled() {
          return !1;
        }
      };
    _i.concat(_d).forEach(function(c) {
      var b = c.split("."),
        g = b.pop();
      b.reduce(function(n, p) {
        return (n[p] = n[p] || {});
      }, f)[g] = function() {
        f.queue.push([c, arguments]);
      };
    });
    a_[_b] = f;
    0 < _g
      ? (
          (a_ = new (a_.XDomainRequest || a_.XMLHttpRequest)()),
          (_b = function() {}),
          a_.open("GET", _r),
          (a_.timeout = _g),
          (a_.onload = function() {
            m();
          }),
          (a_.onerror = _b),
          (a_.onprogress = _b),
          (a_.ontimeout = _b),
          a_.send()
        )
      : m();
  }
})(
  window,
  document,
  "script",
  "airbridge",
  "//static.airbridge.io/sdk/latest/airbridge.min.js",
  "init startTracking fetchResource setBanner setDownload setDownloads openDeeplink setDeeplinks sendWeb setUserAgent setUserAlias addUserAlias setMobileAppData setUserId setUserEmail setUserPhone setUserAttributes clearUser setDeviceAlias removeDeviceAlias clearDeviceAlias setDeviceIFV setDeviceIFA setDeviceGAID events.send events.signIn events.signUp events.signOut events.purchased events.addedToCart events.productDetailsViewEvent events.homeViewEvent events.productListViewEvent events.searchResultViewEvent".split(
    " "
  ),
  ["events.wait", "createTouchpoint"],
  0
);

airbridge.init({
  app: "noel1",
  webToken: "6224689d54ca476eb52a5e7f11119526",
  user: {
    // externalUserID: "noel",
    externalUserEmail: "noel@airbridge.io",
    externalUserPhone: "82(10)1234-1234",
    attributes: {
      age_group: 20,
      gender: "Male"
    }
  }
});
