class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/usagio/releases/download/v0.7.1/usagio-v0.7.1-universal-apple-darwin.tar.gz"
  version "0.7.1"
  sha256 "40d38d675d8910c0bd24cfdc11141cfe667504c5951df5d310395c6b6f936e6b"
  license "MIT"

  # Migration of prior `claude-usage` installs is handled by
  # `tap_migrations.json` at the tap root, which Homebrew 4+ prefers over
  # in-formula `oldname`/`oldnames` DSL (removed in Homebrew 6.x).
  depends_on :macos

  def install
    bin.install "usagio"
    prefix.install "usagio.app"
  end

  post_install_steps do
    run "usagio", "install"
  end

  test do
    assert_match "usagio", shell_output("#{bin}/usagio --help")
  end
  def caveats
    <<~EOS
      usagio install ran automatically as part of this install/upgrade --
      it registers the menu bar app + auto-swap daemon to run now and at
      every login, and (for the app icon in Login Items) points launchd at
      usagio.app/Contents/MacOS/usagio.

      Run `usagio uninstall` to stop the menu bar and remove autostart.
    EOS
  end

end
