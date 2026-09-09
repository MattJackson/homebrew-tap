class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/usagio/releases/download/v0.5.21/usagio-v0.5.21-universal-apple-darwin.tar.gz"
  version "0.5.21"
  sha256 "c387329cebfb4744667003156d773423e4bc256b54403ce80733d842971de034"
  license "MIT"

  # Migration of prior `claude-usage` installs is handled by
  # `tap_migrations.json` at the tap root, which Homebrew 4+ prefers over
  # in-formula `oldname`/`oldnames` DSL (removed in Homebrew 6.x).
  depends_on :macos

  def install
    bin.install "usagio"
    prefix.install "usagio.app"
  end

  def post_install
    system bin/"usagio", "install"
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
