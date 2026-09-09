class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/usagio/releases/download/v0.5.8/usagio-v0.5.8-universal-apple-darwin.tar.gz"
  version "0.5.8"
  sha256 "3f52db295e4ca487df93206f560b97034a335f14832d9d55d393c84d4776814c"
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
