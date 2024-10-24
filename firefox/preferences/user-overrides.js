// Arkenfox & BetterFox
// https://github.com/arkenfox/user.js/
// https://github.com/yokoffing/BetterFox

// USER PREFERENCES {{{

// BACKSPACE
user_pref("browser.backspace_action", 0);

// BOOKMARKS
user_pref("browser.toolbars.bookmarks.visibility", "newtab");
user_pref("browser.tabs.loadBookmarksInTabs", false);
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", true);

// CONTAINERS
user_pref("privacy.userContext.newTabContainersOnLeftClick.enabled", true);

// CSS
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// DEVTOOLS
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.editor.keymap", "vim");
user_pref("devtools.theme", "dark");
user_pref("devtools.toolbox.host", "right");

// DOWNLOAD
user_pref("browser.download.dir", "/home/marci/Downlads");
user_pref("browser.download.folderList", 0);
user_pref("browser.download.lastDir", 0);
user_pref("rowser.download.autohidebutton", true);

// FIND BAR
user_pref("findbar.highlightAll", true);

// FULL SCREEN
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

// POCKET
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
user_pref("browser.urlbar.suggest.bookmark", true);
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

// SIDEBAR
user_pref("sidebar.position_start", false);
user_pref("sidebar.revamp", false);

// TABS
user_perf("browser.tabs.hoverPreview.enabled", 0);
user_perf("browser.tabs.hoverPreview.showThumbnails", 0);

// TOOLBAR
user_pref("browser.compactmode.show", true);
user_pref("browser.tabs.firefox-view", false);
user_pref("browser.tabs.tabmanager.enabled", false);

// WEBSITE APPEARANCE
user_pref("layout.css.prefers-color-scheme.content-override", 0);

/* TODO */
// Disable dialog: "save login info for..."

// }}}

// 0100 - STARTUP {{{

// 0102: Set startup page
// Opts: 0 - Blank, 1 - Home, 2 - Last visited page, 3 - Resume previous session
user_pref("browser.startup.page", 1);
// 0103: Set Home + New window page
user_pref("browser.startup.homepage", "about:blank");
// 0105: Disable Firefox Home sponsored content (Activity Stream)
user_pref("browser.newtabpage.activity-stream.showSponsored", false); // [FF58+]
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // [FF83+]
// 0106: Clear default topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// }}}

// 0200 - GEOLOCATION {{{

// 0202: Disable the OS's geolocation service [FF102+]
user_pref("geo.provider.use_geoclue", false);

// }}}

// 0600 - BLOCK IMPLICIT OUTBOUND {{{
// Specultaive loading (e.g. not explicitly clicked on/hovered)

// 0604: Disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);
// 0605: Disable mousedown speculative connections on bookmarks and history [FF98+]
user_pref("browser.places.speculativeConnect.enabled", false);

// }}}

// 0700 - DNS / DoH / PROXY / SOCKS {{{

// 0702: Set the proxy server to do any DNS lookups when using SOCKS
user_pref("network.proxy.socks_remote_dns", true);
// 0703: Disable using UNC (Uniform Naming Convention) paths [FF61+]
user_pref("network.file.disable_unc_paths", true);
// 0704: Disable GIO as a potential proxy bypass vector [FF118+]
user_pref("network.gio.supported-protocols", "");

// }}}

// 0800 - LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS {{{

// 0801: Disable location bar making speculative connections [FF56+]
user_pref("browser.urlbar.speculativeConnect.enabled", false);
// 0803: Disable live search suggestions
user_pref("browser.urlbar.suggest.searches", false);
// 0806: Disable urlbar suggestions
user_pref("browser.urlbar.addons.featureGate", false); // [FF115+]
user_pref("browser.urlbar.mdn.featureGate", false); // [FF117+]
user_pref("browser.urlbar.pocket.featureGate", false); // [FF116+]
user_pref("browser.urlbar.weather.featureGate", false); // [FF108+]
user_pref("browser.urlbar.yelp.featureGate", false); // [FF124+]

// }}}

// 0900 - PASSWORDS {{{

// 0903: Disable auto-filling username & password form fields
user_pref("signon.autofillForms", false);
// 0904: Disable formless login capture for Password Manager [FF51+]
user_pref("signon.formlessCapture.enabled", false);
// 0905: Limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources
user_pref("network.auth.subresource-http-auth-allow", 1);

// }}}

// 2600 - MISCELLANEOUS {{{

// 2608: Browser toolbox
user_pref("devtools.debugger.remote-enabled", true);

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
