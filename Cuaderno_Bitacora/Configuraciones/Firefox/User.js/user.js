// =============================================================================
// 🐧 MSL / 🐙 CBL – Archivo user.js para Firefox
// Autor: 1973Sobreruedas
// 
// Proyecto en GitHub:
// https://github.com/1973Sobreruedas/Cuaderno-Bitacora-Linuxero-1973Sobreruedas (Español)
//
// Proyecto en Internet:
// https://www.manualdesupervivenciaLinux.com (Español)
//
// Versión 2.0
// 
// Licencia: CC BY-NC-SA 4.0 – Compartir igual, sin uso comercial y con atribución.
// =============================================================================
// Configuración avanzada orientada a la privacidad, al control del navegador
// y a la reducción de servicios no deseados.
//
// Compatible con Firefox 146 o superior.
// Revisar periódicamente para eliminar preferencias obsoletas.
// =============================================================================

// ============================================================================
// 01. Telemetría y reporte de datos
// ============================================================================
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);

user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);

user_pref("toolkit.telemetry.pioneer-new-studies-available", false);

// ============================================================================
// 02. Normandy y estudios
// ============================================================================
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.first_run", false);
user_pref("app.normandy.optoutstudies.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.shieldLearnMoreUrl", "");

user_pref("app.shield.optoutstudies.enabled", false);

// ============================================================================
// 03. Crash Reporter
// ============================================================================

user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.crashReports.unsubmittedCheck.chance", 0);

user_pref("breakpad.reportURL", "");
user_pref("toolkit.crashreporter.infoURL", "");

// ============================================================================
// 04. Safe Browsing
// ============================================================================

user_pref("browser.safebrowsing.allowOverride", false);

user_pref("browser.safebrowsing.blockedURIs.enabled", false);

user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

user_pref("browser.safebrowsing.downloads.remote.block_dangerous", false);
user_pref("browser.safebrowsing.downloads.remote.block_dangerous_host", false);
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);

user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);

// ============================================================================
// 05. Red y conectividad
// ============================================================================

user_pref("geo.enabled", false);
user_pref("geo.wifi.uri", "");

user_pref("media.peerconnection.enabled", false);

user_pref("network.connectivity-service.enabled", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.http.rcwn.enabled", false);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.prefetch-next", false);

user_pref("dom.security.https_only_mode", true);

// ============================================================================
// 06. Privacidad
// ============================================================================

user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.globalprivacycontrol.enabled", true);
user_pref("privacy.globalprivacycontrol.was_ever_enabled", true);

user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.allow_list.baseline.enabled", false);
user_pref("privacy.trackingprotection.allow_list.convenience.enabled", false);

user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

user_pref("dom.forms.autocomplete.formautofill", false);
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// ============================================================================
// 07. Caché, historial y datos locales
// ============================================================================

user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk.smart_size.enabled", false);
user_pref("browser.cache.disk_cache_ssl", false);
user_pref("browser.cache.offline.enable", false);

user_pref("browser.sessionstore.privacy_level", 2);
user_pref("browser.pagethumbnails.capturing_disabled", true);

user_pref("privacy.clearOnShutdown_v2.formdata", true);
user_pref("privacy.clearHistory.formdata", true);
user_pref("privacy.clearSiteData.formdata", true);

// ============================================================================
// 08. Pocket, recomendaciones y promociones
// ============================================================================

user_pref("extensions.pocket.enabled", false);
user_pref("browser.pocket.api", "");
user_pref("extensions.pocket.api", "");

user_pref("browser.discovery.enabled", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

user_pref("browser.aboutwelcome.enabled", false);
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);

user_pref("browser.promo.focus.enabled", false);
user_pref("browser.promo.pin.enabled", false);

user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.system.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showWeather", false);
user_pref("browser.newtabpage.activity-stream.weather.locationSearchEnabled", false);

// ============================================================================
// 09. Inteligencia Artificial (IA)
// ============================================================================

user_pref("browser.ml.chat.shortcuts", false);
user_pref("browser.ml.linkPreview.onboardingTimes", "");
user_pref("extensions.ui.mlmodel.hidden", true);

// Mozilla continúa incorporando nuevas funciones de IA en Firefox.
// En este archivo sólo se añadirán aquellas preferencias que sean
// estables, estén documentadas y aporten mejoras reales de privacidad,
// seguridad o control del navegador.
