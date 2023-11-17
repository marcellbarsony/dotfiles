/* BACKSPACE */
user_pref("browser.backspace_action", 0);

/* BOOKMARKS */
user_pref("browser.toolbars.bookmarks.visibility", "never");

/* CONTAINERS */
user_pref("privacy.userContext.newTabContainersOnLeftClick.enabled", true);

/* CROSS-ORIGIN */
// user_pref("network.auth.subresource-http-auth-allow", 0); // 0905
// user_pref("network.http.referer.XOriginPolicy", 0); // 1601
// user_pref("network.http.referer.XOriginTrimmingPolicy", 0); // 1602

/* EXTENSIONS */
// https://support.mozilla.org/en-US/kb/disable-or-re-enable-pocket-for-firefox
user_pref("extensions.pocket.enabled", false); // 1702

/* FIND BAR */
user_pref("findbar.highlightAll", true);

/* FULL SCREEN */
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

/* LAYOUT */
user_pref("layout.css.devPixelsPerPx", "0.9");

/* MEDIA (DRM)*/
user_pref("media.eme.enabled", true); // 5508

/* PROMO */
user_pref("browser.promo.focus.enabled", false);
user_pref("browser.promo.pin.enabled", false);
user_pref("browser.vpn_promo.enabled", false);

/* RFP [RESIST FINGERPRINTING] */
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504

/* SEARCH */
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.accessibility.tabToSearch.announceResults", false)
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");
user_pref("browser.urlbar.suggest.addons", false);
user_pref("browser.urlbar.suggest.bestmatch", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.calculator", false);
user_pref("browser.urlbar.suggest.clipboard", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.mdn", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.pocket", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.remotetab", false);
user_pref("browser.urlbar.suggest.topsites", false);
user_pref("browser.urlbar.suggest.trending", false);
user_pref("browser.urlbar.suggest.weather", false);
user_pref("services.sync.prefs.sync.browser.urlbar.suggest.bookmark", false);
user_pref("services.sync.prefs.sync.browser.urlbar.suggest.engines", false);
user_pref("services.sync.prefs.sync.browser.urlbar.suggest.history", false);
user_pref("services.sync.prefs.sync.browser.urlbar.suggest.openpage", false);
user_pref("services.sync.prefs.sync.browser.urlbar.suggest.searches", false);
user_pref("services.sync.prefs.sync.browser.urlbar.suggest.topsites", false);

/* SIGNON */
user_pref("signon.rememberSignons", false);  // 5003
user_pref("signon.rememberSignons.visibilityToggle", false);
/* [TODO]: Set default download location */
user_pref("browser.download.folderList", 1);

/* SHUTDOWN */
user_pref("privacy.clearOnShutdown.history", false); // 2811
user_pref("privacy.clearOnShutdown.sessions", false); // 2811

/* STARTUP */
user_pref("browser.startup.page", 1);  // 0102
user_pref("browser.startup.homepage", "https://marcellbarsony.github.io/homepage"); // 0103

/* TOOLBAR */
user_pref("browser.compactmode.show", true);
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.tabmanager.enabled", false);

/* WEBSITE APPEARANCE (DARK) */
user_pref("layout.css.prefers-color-scheme.content-override", 0);

/* TODO */
// Disable save login info for...
// Check all default preferences (about:preferences)
