// Marci's hardened user.js

// USER PREFERENCES {{{
user_pref("_user.js.fox", "USER PREFERENCES :: Error");

// BACKSPACE
user_pref("browser.backspace_action", 0);

// BOOKMARKS
user_pref("browser.toolbars.bookmarks.visibility", "newtab");
user_pref("browser.tabs.loadBookmarksInTabs", false);
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", true);

// CSS
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// DEVTOOLS
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.editor.keymap", "vim");
user_pref("devtools.theme", "dark");
user_pref("devtools.toolbox.host", "right");

// DOWNLOADS
user_pref("browser.download.dir", "/home/marci/Downlads");
user_pref("browser.download.folderList", 0);
user_pref("browser.download.lastDir", 0);
user_pref("rowser.download.autohidebutton", true);

// DRM
user_pref("media.eme.enabled", true);

// FIND BAR
user_pref("findbar.highlightAll", true);

// FULL SCREEN
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);

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

// BETTERFOX {{{
// FASTFOX {{{
user_pref("_user.js.fox", "FASTFOX :: Error");

user_pref("content.notify.interval", 100000);

// CACHE (DISK)
user_pref("browser.cache.disk.enable", false);

// CACHE (MEDIA)
user_pref("media.cache_readahead_limit", 7200);
user_pref("media.cache_resume_threshold", 3600);

// CACHE (IMAGE)
user_pref("image.mem.decode_bytes_at_a_time", 32768);

// GFX RENDERING
user_pref("gfx.canvas.accelerated.cache-size", 512);
user_pref("gfx.content.skia-font-cache-size", 20);

// NETWORK
user_pref("network.http.max-connections", 1800);
user_pref("network.http.max-persistent-connections-per-server", 10);
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
user_pref("network.http.pacing.requests.enabled", false);
user_pref("network.dnsCacheExpiration", 3600);
user_pref("network.ssl_tokens_cache_capacity", 10240);
// }}}

// SECUREFOX {{{
user_pref("_user.js.fox", "SECUREFOX :: Error");

// CONTAINERS
user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", false);

// SEARCH
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.accessibility.tabToSearch.announceResults", false)
user_pref("browser.urlbar.placeholderName", "StartPage");
user_pref("browser.urlbar.placeholderName.private", "StartPage");
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

// }}}

// PESKYFOX {{{
user_pref("_user.js.fox", "PESKYFOX :: Error");

// COOKIE BANNERS
user_pref("cookiebanners.service.mode", 1);
user_pref("cookiebanners.service.mode.privateBrowsing", 1);

// POCKET
user_pref("extensions.pocket.enabled", false);

// PROMO
user_pref("browser.promo.focus.enabled", false);
user_pref("browser.promo.pin.enabled", false);
user_pref("browser.vpn_promo.enabled", false);

// SYNC
user_pref("services.sync.engine.addons", false);
user_pref("services.sync.engine.addresses", false);
user_pref("services.sync.engine.addresses.available", false);
user_pref("services.sync.engine.bookmarks", false);
user_pref("services.sync.engine.creditcards", false);
user_pref("services.sync.engine.creditcards.available", false);
user_pref("services.sync.engine.history", false);
user_pref("services.sync.engine.passwords", false);
user_pref("services.sync.engine.prefs", false);
user_pref("services.sync.engine.prefs.modified", false);
user_pref("services.sync.engine.tabs", false);
// }}}
// }}}

// ARKENFOX {{{
// 0000 - CONFIG {{{
user_pref("_user.js.fox", "0000 :: CONFIG :: Error");

user_pref("browser.aboutConfig.showWarning", false);
// }}}

// 0100 - STARTUP {{{
user_pref("_user.js.fox", "0100 :: STARTUP :: Error");

// 0102: Startup page
// Opts: 0 - Blank, 1 - Home, 2 - Last visited page, 3 - Resume previous session
user_pref("browser.startup.page", 1);
// 0103: Homepage / New window page
user_pref("browser.startup.homepage", "about:blank");
// 0104: NEWTAB page
// Opts: true=Firefox Home, false=blank page
user_pref("browser.newtabpage.enabled", false);
// 0105: Disable Firefox Home sponsored content (Activity Stream)
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
// 0106: Clear default topsites
user_pref("browser.newtabpage.activity-stream.default.sites", "");
// }}}

// 0200 - GEOLOCATION {{{
user_pref("_user.js.fox", "0200 :: GEOLOCATION :: Error");

user_pref("_user.js.fox", "0200: The Fox is definitely deceased!");
// 0202: Disable the OS's geolocation service
user_pref("geo.provider.use_geoclue", false);
// }}}

// 0300 - QUIETER FOX {{{
user_pref("_user.js.fox", "0300 :: QUIETER FOX :: Error");

// 0320: Disable Recommendation pane in about:addons (uses Google Analytics)
user_pref("extensions.getAddons.showPane", false);
// 0321: Disable Recommendations in about:addons' Extensions and Themes panes
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
// 0322: Disable Personalized Extension Recommendations in about:addons and AMO
user_pref("browser.discovery.enabled", false);
// 0323: Disable Shopping experience
user_pref("browser.shopping.experience2023.enabled", false);

// TELEMETRY
// 0335: Disable Firefox Home (Activity Stream) telemetry
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);

// STUDIES
// 0340: Disable Studies
user_pref("app.shield.optoutstudies.enabled", false);
// 0341: Disable Normandy/Shield
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// CRASH REPORTS
// 0350: Disable Crash Reports
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
// 0351: Enforce no submission of backlogged Crash Reports
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

// OTHER
// 0360: Disable Captive Portal detection
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
// 0361: Disable Network Connectivity checks
user_pref("network.connectivity-service.enabled", false);
// }}}

// 0400 - SAFE BROWSING {{{
user_pref("_user.js.fox", "0400 :: SAFE BROWSING :: Error");

user_pref("browser.safebrowsing.downloads.remote.enabled", false);
// }}}

// 0600 - BLOCK IMPLICIT OUTBOUND {{{
user_pref("_user.js.fox", "0600 :: BLOCK IMPLICIT OUTBOUND :: Error");

// 0601: Disable link prefetching
user_pref("network.prefetch-next", false);
// 0602: Disable DNS prefetching
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
// 0603: Disable predictor / prefetching
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
// 0604: Disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);
// 0605: Disable mousedown speculative connections on bookmarks and history
user_pref("browser.places.speculativeConnect.enabled", false);
// }}}

// 0700 - DNS / DoH / PROXY / SOCKS {{{
user_pref("_user.js.fox", "0700 ::  DNS / DOH / PROXY / SOCKS :: Error");

// 0702: Set the proxy server to do any DNS lookups when using SOCKS
user_pref("network.proxy.socks_remote_dns", true);
// 0703: Disable using UNC (Uniform Naming Convention) paths
user_pref("network.file.disable_unc_paths", true);
// 0704: Disable GIO as a potential proxy bypass vector
user_pref("network.gio.supported-protocols", "");
// }}}

// 0800 - LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS {{{
user_pref("_user.js.fox", "0800 ::  LOCATION BAR / SEARCH BAR / SUGGESTIONS HISTORY / FORMS :: Error");

// 0801: Disable location bar making speculative connections
user_pref("browser.urlbar.speculativeConnect.enabled", false);
// 0802: Disable location bar contextual suggestions
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
// 0803: Disable live search suggestions
user_pref("browser.urlbar.suggest.searches", false);
// 0805: disable urlbar trending search suggestions
user_pref("browser.urlbar.trending.featureGate", false);
// 0806: Disable urlbar suggestions
user_pref("browser.urlbar.addons.featureGate", false);
user_pref("browser.urlbar.mdn.featureGate", false);
user_pref("browser.urlbar.fakespot.featureGate", false);
user_pref("browser.urlbar.pocket.featureGate", false);
user_pref("browser.urlbar.weather.featureGate", false);
user_pref("browser.urlbar.yelp.featureGate", false);
// 0810: Disable search and form history
user_pref("browser.formfill.enable", false);
// 0830: enable separate default search engine in Private Windows and its UI setting
user_pref("browser.search.separatePrivateDefault", true);
user_pref("browser.search.separatePrivateDefault.ui.enabled", true);
// }}}

// 0900 - PASSWORDS {{{
user_pref("_user.js.fox", "0900 ::  PASSWORDS :: Error");

// 0903: Disable auto-filling username & password form fields
user_pref("signon.autofillForms", false);
// 0904: Disable formless login capture for Password Manager
user_pref("signon.formlessCapture.enabled", false);
// 0905: Limit HTTP authentication credentials dialogs triggered by sub-resources
user_pref("network.auth.subresource-http-auth-allow", 1);
// }}}

// 1000 - DISK AVOIDANCE {{{
user_pref("_user.js.fox", "1000 :: DISK AVOIDANCE :: Error");

// 1001: disable disk cache
user_pref("browser.cache.disk.enable", false);
// 1002: set media cache in Private Browsing to in-memory and increase its maximum size
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);
// 1003: disable storing extra session data
// Opts: 0 - Everywhere, 1 - Unencrypted sites, 2 - Nowhere
user_pref("browser.sessionstore.privacy_level", 2);
// }}}

// 1200 - HTTPS SSL/TLS / OCSP / CERTS / HPKP {{{
user_pref("_user.js.fox", "1200 :: HTTPS / SSL/TLS / OSCP / CERTS / HPK :: Error");

// SSL / TLS
// 1201: require safe negotiation
user_pref("security.ssl.require_safe_negotiation", true);
// 1206: disable TLS1.3 0-RTT (round-trip time)
user_pref("security.tls.enable_0rtt_data", false);

// OSCP
// 1211: enforce OCSP fetching to confirm current validity of certificates
user_pref("security.OCSP.enabled", 1);
// 1212: set OCSP fetch failures to hard-fail
user_pref("security.OCSP.require", true);

// CERTS / HPKP
// 1223: enable strict PKP (Public Key Pinning)
// Opts: 0 - Disabled, 1 - Allow user MiTM, 2 - Strict
user_pref("security.cert_pinning.enforcement_level", 2);
// 1244: enable HTTPS-Only mode in all windows
user_pref("dom.security.https_only_mode", true);
// 1246: disable HTTP background requests
user_pref("dom.security.https_only_mode_send_http_background_request", false);

// MIXED CONTENT
// 1244: Enable HTTPS-Only mode in all windows
user_pref("dom.security.https_only_mode", true);
// 1246: disable HTTP background requests
user_pref("dom.security.https_only_mode_send_http_background_request", false);

// UI (User Interface)
// 1270: display warning on the padlock for "broken security" (if 1201 is false)
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
// 1272: display advanced information on Insecure Connection warning pages
user_pref("browser.xul.error_pages.expert_bad_cert", true);
// }}}

// 1600 - REFERERS {{{
user_pref("_user.js.fox", "1600 :: REFERERS :: Error");

// 1602: control the amount of cross-origin information to send
// Opts: 0=send full URI (default), 1=scheme+host+port+path, 2=scheme+host+port
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
// }}}

// 1700 - CONTAINERS {{{
user_pref("_user.js.fox", "1700 :: CONTAINERS :: Error");

// 1701: enable Container Tabs and its UI setting
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);
// }}}

// 2000 - PLUGINS / MEDIA / WEBRTC {{{
user_pref("_user.js.fox", "2000 :: PLUGINS / MEDIA / WEBRTC :: Error");

// 2002: force WebRTC inside the proxy
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
// 2003: force a single network interface for ICE candidates generation
user_pref("media.peerconnection.ice.default_address_only", true);
// }}}

// 2400 - DOM {{{
user_pref("_user.js.fox", "2400 :: DOM (Document Object Model) :: Error");

// 2402: prevent scripts from moving and resizing open windows
user_pref("dom.disable_window_move_resize", true);
// }}}

// 2600 - MISCELLANEOUS {{{
user_pref("_user.js.fox", "2600 :: MISCELLANEOUS :: Error");

// 2608: Browser toolbox
user_pref("devtools.debugger.remote-enabled", true);

// DOWNLOADS
// 2651: Enable user interaction for security by always asking where to download
user_pref("browser.download.useDownloadDir", false);
// 2652: Disable downloads panel opening on every download
user_pref("browser.download.alwaysOpenPanel", false);
// 2653: Disable adding downloads to the system's "recent documents" list
user_pref("browser.download.manager.addToRecentDocs", false);
// 2654: Enable user interaction for security by always asking how to handle new mimetypes
user_pref("browser.download.always_ask_before_handling_new_types", true);

// EXTENSIONS
// 2660: Limit allowed extension directories
user_pref("extensions.enabledScopes", 5);
// 2661: Disable bypassing 3rd party extension install prompts
user_pref("extensions.postDownloadThirdPartyPrompt", false);
// }}}

// 2700 - ETP {{{
user_pref("_user.js.fox", "2700 :: ETP (Enhanced Tracking Protocol) :: Error");

// 2701: enable ETP Strict Mode
user_pref("browser.contentblocking.category", "strict");
// }}}

// 2800 - SHUTDOWN & SANITIZING {{{
user_pref("_user.js.fox", "2800 :: ETP (Enhanced Tracking Protocol) :: Error");

// 2810: Enable Firefox to clear items on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", true);

// SANITIZE ON SHUTDOWN: Ignores "ALLOW" site exceptions
// 2811: Set/enforce clearOnShutdown items
user_pref("privacy.clearOnShutdown_v2.cache", true);
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", true);
// 2812: Set/enforce clearOnShutdown items
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", true);
user_pref("privacy.clearOnShutdown_v2.downloads", true);
user_pref("privacy.clearOnShutdown_v2.formdata", true);

// SANITIZE ON SHUTDOWN: Respects "ALLOW" site exceptions
// 2815: Set "Cookies" and "Site Data" to clear on shutdown
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);

// SANITIZE SITE DATA: Ignores "ALLOW" site exceptions
// 2820: Set manual "Clear Data" items
user_pref("privacy.clearSiteData.cache", true);
user_pref("privacy.clearSiteData.cookiesAndStorage", false);
user_pref("privacy.clearSiteData.historyFormDataAndDownloads", true);
// 2821: Set manual "Clear Data" items
user_pref("privacy.clearSiteData.browsingHistoryAndDownloads", true);
user_pref("privacy.clearSiteData.formdata", true);

// SANITIZE HISTORY: Ignores "ALLOW" site exceptions
// 2830: Set manual "Clear History" items, also via Ctrl-Shift-Del
user_pref("privacy.clearHistory.cache", true);
user_pref("privacy.clearHistory.cookiesAndStorage", false);
user_pref("privacy.clearHistory.historyFormDataAndDownloads", true);
// 2831: Set manual "Clear History" items
user_pref("privacy.clearHistory.browsingHistoryAndDownloads", true);
user_pref("privacy.clearHistory.formdata", true);

// SANITIVE MANUAL: Timerange
// 2840: set "Time range to clear" for "Clear Data" (2820) and "Clear History" (2830)
// Opts: 0 - Everything, 1 - Last hour, 2 - Last two hours, 3 - Last four hours, 4 - Today
user_pref("privacy.sanitize.timeSpan", 0);
// }}}

// 4500 - OPTIONAL RFP {{{
user_pref("_user.js.fox", "4500 :: OPTIONAL RFP (resistFingerprinting) :: Error");

// 4506: Disable RFP spoof english prompt
// Opts: 0 - Prompt, 1 - Disabled, 2 - Enabled
user_pref("privacy.spoof_english", 1);
// 4510: Disable using system colors
user_pref("browser.display.use_system_colors", false);
// 4512: Enforce links targeting new windows to open in a new tab instead
// Opts: 1 - Most recent window or tab, 2 - New window, 3 - New tab
user_pref("browser.link.open_newwindow", 3);
// 4513: Set all open window methods to abide by "browser.link.open_newwindow" (4512)
user_pref("browser.link.open_newwindow.restriction", 0);
// }}}

// 5000 - OPTIONAL OPSEC {{{
user_pref("_user.js.fox", "5000 :: OPTIONAL OPSEC :: Error");

// 5003: Disable saving passwords
user_pref("signon.rememberSignons", false);
user_pref("signon.rememberSignons.visibilityToggle", false);
// }}}

// 8500 - TELEMETRY {{{
user_pref("_user.js.fox", "8500 :: TELEMETRY :: Error");

// 8500: Disable new data submission
user_pref("datareporting.policy.dataSubmissionEnabled", false);
// 8501: Disable Health Reports
user_pref("datareporting.healthreport.uploadEnabled", false);
// 0802: Disable telemetry
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
// 8503: Disable Telemetry Coverage
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
// }}}

// SUCCESS {{{
user_pref("_user.js.fox", "SUCCESS");
// }}}
// }}}
