// Arkenfox
// https://github.com/arkenfox/user.js/

// USER PREFERENCES {{{

// BACKSPACE
user_pref("browser.backspace_action", 0);

// BOOKMARKS
user_pref("browser.toolbars.bookmarks.visibility", "never");

// CONTAINERS
user_pref("privacy.userContext.newTabContainersOnLeftClick.enabled", true);

// CROSS-ORIGIN
// user_pref("network.auth.subresource-http-auth-allow", 0); // 0905
// user_pref("network.http.referer.XOriginPolicy", 0); // 1601
// user_pref("network.http.referer.XOriginTrimmingPolicy", 0); // 1602

// CSS
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// DOWNLOAD
user_pref("browser.download.dir", "/home/marci/tmp");
user_pref("browser.download.folderList", 0);
user_pref("browser.download.lastDir", 0);

// FIND BAR
user_pref("findbar.highlightAll", true);

// FULL SCREEN
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

// LAYOUT
// user_pref("layout.css.devPixelsPerPx", "0.9"); // Crashing on Hyprland

// LIST ALL TABS
user_perf("browser.tabs.hoverPreview.enabled", 0);

// POCKET
// https://support.mozilla.org/en-US/kb/disable-or-re-enable-pocket-for-firefox
user_pref("extensions.pocket.enabled", false);

// PROMO
user_pref("browser.promo.focus.enabled", false);
user_pref("browser.promo.pin.enabled", false);
user_pref("browser.vpn_promo.enabled", false);

// SEARCH
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

// TOOLBAR
user_pref("browser.compactmode.show", true);
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.tabmanager.enabled", false);

// WEBSITE APPEARANCE
user_pref("layout.css.prefers-color-scheme.content-override", 0);

// TODO //
// Disable dialog: "save login info for..."

// }}}

// 0100 - STARTUP {{{

// 0102: Set startup page
// Opts: 0 - Blank, 1 - Home, 2 - Last visited page, 3 - Resume previous session
user_pref("browser.startup.page", 1);

// 0103: Set Home + New window page
user_pref("browser.startup.homepage", "https://marcellbarsony.github.io/homepage");

// }}}

// 2600 - MISCELLANEOUS {{{

// 2608: Browser toolbox
//user_pref("devtools.debugger.remote-enabled", true);

// }}}

// 2800 - SHUTDOWN & SANITIZING {{{

// 2811: Set/enforce what items to clear on shutdown
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);

// }}}

// 4500 - OPTIONAL RFP (resistFingerprinting) {{{

// 4504: RFP (RESIST FINGERPRINTING/Randomized Fingerprinting Protection)
//user_pref("privacy.resistFingerprinting.letterboxing", false);

// }}}

// 5000 - OPTIONAL OPSEC {{{

// 5003: Disable saving passwords
user_pref("signon.rememberSignons", false);
user_pref("signon.rememberSignons.visibilityToggle", false);

// }}}

// 5500 - OPTIONAL HARDENING {{{

// 5508: DRM (EME: Encryption Media Extension)
user_pref("media.eme.enabled", true);

// }}}

// 7000 - DON'T BOTHER {{{

// 7020: WebRTC (Web Real-Time Communication)
// user_pref("media.peerconnection.enabled", false);

// }}}
