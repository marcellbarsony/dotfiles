// Arkenfox & BetterFox
// https://github.com/arkenfox/user.js/
// https://github.com/yokoffing/BetterFox

// LAUNCH {{{
user_pref("_user.js.astronaut", "3... 2... 1... LIFTOFF");
// }}}

// USER PREFERENCES {{{

// BACKSPACE
user_pref("browser.backspace_action", 0);

// BOOKMARKS
user_pref("browser.toolbars.bookmarks.visibility", "newtab");
user_pref("browser.tabs.loadBookmarksInTabs", false);
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", true);

// CONTAINERS
user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", false);

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
user_pref("browser.tabs.tabmanager.enabled", false);

// TRANSLATION
user_pref("browser.translations.neverTranslateLanguages", "hu");

// WEBSITE APPEARANCE
user_pref("layout.css.prefers-color-scheme.content-override", 0);
// }}}

// 0100 - STARTUP {{{
user_pref("_user.js.astronaut", "0100: To infinity and beyond!");
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
user_pref("_user.js.astronaut", "0200: The universe is a pretty big place");
// 0202: Disable the OS's geolocation service [FF102+]
user_pref("geo.provider.use_geoclue", false);
// }}}

// 0600 - BLOCK IMPLICIT OUTBOUND {{{
user_pref("_user.js.astronaut", "0600: Galaxies are islands of stars");
// Specultaive loading (e.g. not explicitly clicked on/hovered)
// 0604: Disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);
// 0605: Disable mousedown speculative connections on bookmarks and history [FF98+]
user_pref("browser.places.speculativeConnect.enabled", false);
// }}}

// 0700 - DNS / DoH / PROXY / SOCKS {{{
user_pref("_user.js.astronaut", "0700: The stars are shining bright");
// 0702: Set the proxy server to do any DNS lookups when using SOCKS
user_pref("network.proxy.socks_remote_dns", true);
// 0703: Disable using UNC (Uniform Naming Convention) paths [FF61+]
user_pref("network.file.disable_unc_paths", true);
// 0704: Disable GIO as a potential proxy bypass vector [FF118+]
user_pref("network.gio.supported-protocols", "");
// }}}

// 0800 - LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS {{{
user_pref("_user.js.astronaut", "0800: So much universe and so little time");
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
user_pref("_user.js.astronaut", "0900: The stars don't look bigger, but they do look brighter");
// 0903: Disable auto-filling username & password form fields
user_pref("signon.autofillForms", false);
// 0904: Disable formless login capture for Password Manager [FF51+]
user_pref("signon.formlessCapture.enabled", false);
// 0905: Limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources
user_pref("network.auth.subresource-http-auth-allow", 1);
// }}}

// 1000 - DISK AVOIDANCE {{{
user_pref("_user.js.astronaut", "1000: We're all made of stardust");
// 1001: disable disk cache
user_pref("browser.cache.disk.enable", false);
// 1003: disable storing extra session data
// Opts: 0 - Everywhere, 1 - Unencrypted sites, 2 - Nowhere
user_pref("browser.sessionstore.privacy_level", 2);
// }}}

// 1200 - HTTPS SSL/TLS / OCSP / CERTS / HPKP {{{
user_pref("_user.js.astronaut", "1200: Houston, Tranquility Base here. The Eagle has landed");
// 1201: require safe negotiation
user_pref("security.ssl.require_safe_negotiation", true);
// 1212: set OCSP fetch failures to hard-fail
user_pref("security.OCSP.require", true);
// 1223: enable strict PKP (Public Key Pinning)
// Opts: 0 - Disabled, 1 - Allow user MiTM, 2 - Strict
user_pref("security.cert_pinning.enforcement_level", 2);
// 1244: enable HTTPS-Only mode in all windows [FF76+]
user_pref("dom.security.https_only_mode", true);
// 1246: disable HTTP background requests [FF82+]
user_pref("dom.security.https_only_mode_send_http_background_request", false);
// }}}

// 2000 - PLUGINS / MEDIA / WEBRTC {{{
user_pref("_user.js.astronaut", "2000: I looked and looked but I didn’t see god");
// 2002: force WebRTC inside the proxy [FF70+]
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
// 2003: force a single network interface for ICE candidates generation [FF42+]
user_pref("media.peerconnection.ice.default_address_only", true);
// }}}

// 2400 - DOM (DOCUMENT OBJECT MODEL) {{{
user_pref("_user.js.astronaut", "2400: We're all astronauts, whether we know it or not");
// 2402: prevent scripts from moving and resizing open windows
user_pref("dom.disable_window_move_resize", true);
// }}}

// 2600 - MISCELLANEOUS {{{
user_pref("_user.js.astronaut", "2600: We are all connected to the cosmic energy");
// 2608: Browser toolbox
user_pref("devtools.debugger.remote-enabled", true);
// }}}

// 2800 - SHUTDOWN & SANITIZING {{{
user_pref("_user.js.astronaut", "2800: The cosmos is full of wonders");
// 2811: Sanitize on shutdown (history)
user_pref("privacy.clearOnShutdown.history", false);
// 2815: Sanitize on shutdown (sessions)
user_pref("privacy.clearOnShutdown.sessions", false);
// 2840: set "Time range to clear" for "Clear Data" (2820) and "Clear History" (2830)
// Opts: 0 - Everything, 1 - Last hour, 2 - Last two hours, 3 - Last four hours, 4 - Today
user_pref("privacy.sanitize.timeSpan", 0);
// }}}

// 4500 - OPTIONAL RFP (resistFingerprinting) {{{
user_pref("_user.js.astronaut", "4500: Nebulae are clouds of gas and dust");
// 4504: RFP (RESIST FINGERPRINTING/Randomized Fingerprinting Protection)
//user_pref("privacy.resistFingerprinting.letterboxing", false);
// 4506: disable RFP spoof english prompt [FF59+]
// Opts: 0 - Prompt, 1 - Disabled, 2 - Enabled
user_pref("privacy.spoof_english", 1);
// 4510: disable using system colors
user_pref("browser.display.use_system_colors", false);
// 4512: enforce links targeting new windows to open in a new tab instead
// Opts: 1 - Most recent window or tab, 2 - New window, 3 - New tab
user_pref("browser.link.open_newwindow", 3);
// 4513: set all open window methods to abide by "browser.link.open_newwindow" (4512)
user_pref("browser.link.open_newwindow.restriction", 0);
// }}}

// 5000 - OPTIONAL OPSEC {{{
user_pref("_user.js.astronaut", "5000: The universe is a mystery waiting to be solved");
// 5003: Disable saving passwords
user_pref("signon.rememberSignons", false);
user_pref("signon.rememberSignons.visibilityToggle", false);
// }}}

// 5500 - OPTIONAL HARDENING {{{
user_pref("_user.js.astronaut", "5500: The universe is a vast ocean of stars");
// 5508: DRM (EME: Encryption Media Extension)
user_pref("media.eme.enabled", true);
// }}}

// 7000 - DON'T BOTHER {{{
user_pref("_user.js.astronaut", "7000: The stars are the universe's eternal guardians");
// 7020: WebRTC (Web Real-Time Communication)
// user_pref("media.peerconnection.enabled", false);
// }}}

// SUCCESS {{{
user_pref("_user.js.astronaut", "LANDING: The astronaut has completed the mission");
// }}}
