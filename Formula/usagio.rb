class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/usagio/releases/download/v0.4.3/usagio-v0.4.3-universal-apple-darwin.tar.gz"
  version "0.4.3"
  sha256 "5c103f9c92d7c843dcb172c89cff7f3e4477b62d782b38dd0b25713a6df51993"
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
