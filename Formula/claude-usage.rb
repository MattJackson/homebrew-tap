class ClaudeUsage < Formula
  desc "Usage across multiple Claude Max accounts, instant switch, and auto-swap before the limit"
  homepage "https://github.com/MattJackson/claude-usage"
  url "https://github.com/MattJackson/claude-usage/releases/download/v0.2.0/claude-usage-v0.2.0-universal-apple-darwin.tar.gz"
  sha256 "7f0045fa40f79bf6b58c8df306862d7dd8990b93c1e84fb1ac2e431eca5e5d7e"
  version "0.2.0"
  license "MIT"

  depends_on :macos

  def install
    bin.install "claude-usage"
  end

  def caveats
    <<~EOS
      To run the menu-bar app + auto-swap daemon now and at every login:
        claude-usage install

      Onboard an account: log in with `claude` (/login), then:
        claude-usage capture <name>
    EOS
  end

  test do
    assert_match "claude-usage", shell_output("#{bin}/claude-usage --help")
  end
end
