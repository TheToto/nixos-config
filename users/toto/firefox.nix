{ config, lib, pkgs, ... }:

{
  # ShyFox theme
  # Maybe move this nix file to the FirefoxTheme repo as flake ?
  home.file."firefox-theme" = {
        target = ".mozilla/firefox/default/chrome/FirefoxTheme";
        source = (fetchTarball "https://github.com/thetoto/FirefoxTheme/archive/master.tar.gz");
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      # Most parameters will be synced with Firefox Sync
      # Sidebery settings must be loaded manually from the json in chrome directory
      name = "Default";
      settings = {
        "browser.startup.homepage" = "about:home";

        # Do not load pinned tabs at startup
        "browser.sessionstore.restore_pinned_tabs_on_demand" = true;

        # Disable irritating first-run stuff
        "browser.disableResetPrompt" = true;
        "browser.download.panel.shown" = true;
        "browser.feeds.showFirstRunUI" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.rights.3.shown" = true;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.uitour.enabled" = false;
        "startup.homepage_override_url" = "";
        "trailhead.firstrun.didSeeAboutWelcome" = true;
        "browser.bookmarks.restore_default_bookmarks" = false;
        "browser.bookmarks.addedImportButton" = true;

        # Disable crappy home activity stream page
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

        # Disable some telemetry
        "app.shield.optoutstudies.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemetry" = false;
        "datareporting.healthreport.service.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.sessions.current.clean" = true;
        "devtools.onboarding.telemetry.logged" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.prompted" = 2;
        "toolkit.telemetry.rejected" = true;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.unifiedIsOptIn" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        # Disable "save password" prompt
        "signon.rememberSignons" = false;

        # Harden
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = true;

        # UI
        "browser.uiCustomization.state" = ''
          {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["sponsorblocker_ajay_app-browser-action","_testpilot-containers-browser-action","_3c078156-979c-498b-8990-85f7987dd929_-browser-action","amptra_keepa_com-browser-action","gdpr_cavi_au_dk-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","extension_foxtana_com-browser-action","_dbac9680-d559-4cd4-9765-059879e8c467_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","faststream_andrews-browser-action","atbc_easonwong-browser-action","jid1-oy8xu5bskzqa6a_jetpack-browser-action"],"nav-bar":["back-button","stop-reload-button","forward-button","customizableui-special-spring1","customizableui-special-spring5","urlbar-container","customizableui-special-spring4","customizableui-special-spring2","unified-extensions-button","zoom-controls"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["downloads-button","ublock0_raymondhill_net-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","tabbrowser-tabs","sidebar-button","alltabs-button","userchrome-toggle-extended_n2ezr_ru-browser-action","customizableui-special-spring6","fullscreen-button","fxa-toolbar-menu-button","bookmarks-menu-button","history-panelmenu","preferences-button"],"PersonalToolbar":["personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","amptra_keepa_com-browser-action","sponsorblocker_ajay_app-browser-action","gdpr_cavi_au_dk-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","_testpilot-containers-browser-action","extension_foxtana_com-browser-action","ublock0_raymondhill_net-browser-action","_dbac9680-d559-4cd4-9765-059879e8c467_-browser-action","_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action","userchrome-toggle-extended_n2ezr_ru-browser-action","_3c078156-979c-498b-8990-85f7987dd929_-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","faststream_andrews-browser-action","atbc_easonwong-browser-action","jid1-oy8xu5bskzqa6a_jetpack-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","unified-extensions-area","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":20,"newElementCount":21}
        '';
        "bookmark.toolbars.bookmarks.visibility" = "always";
        "shyfox.disable.floating.search" = true;
        "shyfox.enable.ext.mono.toolbar.icons" = true;
        "shyfox.larger.context.menu" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
      userContent = ''
        @import "FirefoxTheme/chrome/userContent.css";
      '';
      userChrome = ''
          @import "FirefoxTheme/chrome/userChrome.css";
      '';
    };
  };
}