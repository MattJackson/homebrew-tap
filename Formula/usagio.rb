class Usagio < Formula
  desc "AI coding CLI usage from the menu bar, instant switch, auto-swap"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/claude-usage/releases/download/v0.4.0/usagio-v0.4.0-universal-apple-darwin.tar.gz"
  version "0.4.0"
  sha256 "d3e0d082f259960e29e591865a67a453991fce43e715ffe0654712ad046308f0"
  license "MIT"

  # Transparently migrate users installed as `claude-usage` to `usagio` on next
  # `brew upgrade`. See `Formula/claude-usage.rb` for the parallel deprecated
  # entry that keeps `brew install claude-usage` working for now.
  oldname "claude-usage"

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
