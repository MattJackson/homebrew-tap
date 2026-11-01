class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/usagio/releases/download/v1.0.7/usagio-v1.0.7-universal-apple-darwin.tar.gz"
  version "1.0.7"
  sha256 "466328aeb8875bea9d4eda815695b35298bac29e9399f55f1be9be021a1ada3b"
  license "MIT"

  # Migration of prior `claude-usage` installs is handled by
  # `tap_migrations.json` at the tap root, which Homebrew 4+ prefers over
  # in-formula `oldname`/`oldnames` DSL (removed in Homebrew 6.x).
  depends_on :macos

  def install
    bin.install "usagio"
    prefix.install "usagio.app"
  end

  test do
    assert_match "usagio", shell_output("#{bin}/usagio --help")
  end
  def caveats
    <<~EOS
      To start the menu bar app + auto-swap daemon (now and at every login),
      run once from your shell:

        usagio install

      It registers the menu bar + daemon under your account and (for the app
      icon in Login Items) points launchd at
      usagio.app/Contents/MacOS/usagio. `brew install` no longer does this
      automatically (Homebrew forbids formulae from writing to your home).

      Run `usagio uninstall` to stop the menu bar and remove autostart.
    EOS
  end

end
