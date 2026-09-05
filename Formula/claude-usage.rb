class ClaudeUsage < Formula
  desc "Usage across multiple Claude Max accounts, instant switch, and auto-swap before the limit"
  homepage "https://github.com/MattJackson/claude-usage"
  url "https://github.com/MattJackson/claude-usage/releases/download/v0.1.2/claude-usage-v0.1.2-universal-apple-darwin.tar.gz"
  sha256 "4b0da60109a41cbfc4e61273946d08ef315058a9e166579587e5271291fce2b0"
  version "0.1.2"
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
