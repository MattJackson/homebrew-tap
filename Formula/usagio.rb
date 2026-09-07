class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/usagio/releases/download/v0.4.1/usagio-v0.4.1-universal-apple-darwin.tar.gz"
  version "0.4.1"
  sha256 "be8946348a8eff67c86e4972345ab08109e195bca7c0ee4b47b22219787f3fac"
  license "MIT"

  # Migration of prior `claude-usage` installs is handled by
  # `tap_migrations.json` at the tap root, which Homebrew 4+ prefers over
  # in-formula `oldname`/`oldnames` DSL (removed in Homebrew 6.x).
  depends_on :macos

  def install
    bin.install "usagio"
  end

  def caveats
    <<~EOS
      To run the menu-bar app + auto-swap daemon now and at every login:
        usagio install

      Onboard an account: log in with `claude` or `codex` first, then:
        usagio capture

      Formerly published as `claude-usage`; existing installs migrate on
      `brew upgrade`. State auto-migrates from ~/.config/claude-usage/
      to ~/.config/usagio/ on first run.
    EOS
  end

  test do
    assert_match "usagio", shell_output("#{bin}/usagio --help")
  end
end
