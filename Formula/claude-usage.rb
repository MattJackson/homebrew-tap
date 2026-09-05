class ClaudeUsage < Formula
  desc "Usage across multiple Claude Max accounts, instant switch, and auto-swap before the limit"
  homepage "https://github.com/MattJackson/claude-usage"
  url "https://github.com/MattJackson/claude-usage/releases/download/v0.1.6/claude-usage-v0.1.6-universal-apple-darwin.tar.gz"
  sha256 "f9baef614157496757d6795f665fbc1990909f454d2a44eab1759a07685be106"
  version "0.1.6"
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
