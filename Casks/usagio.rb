# Cask for the signed & notarised menu-bar .app bundle of usagio.
#
# STATUS: DRAFT — waiting on Apple Developer ID + notarised .dmg build in
# the release pipeline. Until that's live, use `brew install
# MattJackson/tap/usagio` (the CLI formula) plus `usagio install` to bring
# up the menu-bar autostart. When the signed .dmg starts shipping as a
# release asset, drop `sha256 :no_check` and fill in the real checksum,
# then bump versions in lockstep with the CLI formula.
cask "usagio" do
  version "0.4.0"
  sha256 :no_check # TODO: real sha256 once signed .dmg is being produced by CI

  url "https://github.com/MattJackson/usagio/releases/download/v#{version}/usagio-v#{version}.dmg"
  name "usagio"
  desc "Menu-bar app for AI-CLI usage tracking (Claude Code, Codex, and more)"
  homepage "https://usagio.dev/"

  auth_method :interactive # keychain access on first launch

  depends_on macos: :ventura # macOS 13+

  app "usagio.app"

  # Launch the menu-bar autostart the same way `usagio install` would.
  postflight do
    system_command "#{appdir}/usagio.app/Contents/MacOS/usagio",
                   args: ["install"],
                   sudo: false
  end

  uninstall launchctl: "com.mattjackson.usagio.menubar",
            quit:      "com.mattjackson.usagio",
            delete:    [
              "~/Library/Application Support/usagio",
              "~/Library/LaunchAgents/com.mattjackson.usagio.menubar.plist",
            ]

  # Full state removal on `brew uninstall --zap`. Keychain items are left
  # in place so a reinstall recovers the user's captured accounts; see
  # caveats.
  zap trash: [
    "~/.config/usagio",
    "~/Library/Application Support/usagio",
    "~/Library/Caches/usagio",
    "~/Library/Preferences/com.mattjackson.usagio.plist",
  ]

  caveats <<~EOS
    usagio keeps OAuth tokens in the macOS Keychain under the service name
    "claude-usage" (unchanged across the rename to preserve existing
    captures). To wipe those too, run:
      security delete-generic-password -s claude-usage

    Note: this cask installs the .app bundle; the CLI is embedded inside
    the bundle. If you prefer the CLI on your PATH, `brew install
    MattJackson/tap/usagio` alongside.
  EOS
end
