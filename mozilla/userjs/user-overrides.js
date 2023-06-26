/* STARTUP */
// 0102: Startup
user_pref("browser.startup.page", 1);
// 0103: Homepage
user_pref("browser.startup.homepage", "https://marcellbarsony.github.io/homepage");

/* MEDIA */
// 2022: DRM
user_pref("media.eme.enabled", true);

/* SHUTDOWN */
// 2811: Clear on shutdown
user_pref("privacy.clearOnShutdown.history", false);
user_pref("privacy.clearOnShutdown.sessions", false);

/* RFP - RESIST FINGERPRINTING */
// 4504: Letterboxing
user_pref("privacy.resistFingerprinting.letterboxing", false);
