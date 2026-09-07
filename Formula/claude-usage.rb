# Deprecated: renamed to `usagio`. This stub keeps `brew install claude-usage`
# working by delegating to the new formula via `depends_on`, so a fresh
# install of `claude-usage` pulls `usagio` in transitively and the user ends
# up with the real binary on PATH under both names.
#
# Existing installs are migrated transparently via `oldname "claude-usage"`
# in Formula/usagio.rb (Homebrew rewrites them on `brew upgrade`), so this
# file only serves brand-new `brew install claude-usage` invocations that
# arrive after the rename.
#
# Slated for removal 6 months after the rename (see migration-plan.md).
class ClaudeUsage < Formula
  desc "Deprecated alias for `usagio` (renamed 2026-09-06)"
  homepage "https://usagio.dev"
  url "https://github.com/MattJackson/claude-usage/releases/download/v0.4.0/usagio-v0.4.0-universal-apple-darwin.tar.gz"
  version "0.4.0"
  sha256 "d3e0d082f259960e29e591865a67a453991fce43e715ffe0654712ad046308f0"
  license "MIT"

  # Warns on install/upgrade but does NOT block. Users see:
  #   Warning: claude-usage has been deprecated because it was renamed to usagio!
  deprecate! date: "2026-09-06", because: :repo_renamed, replacement: "MattJackson/tap/usagio"

  # Transitive install: `brew install claude-usage` pulls usagio too, so the
  # user gets the current binary + Keychain-migrating first-run behaviour
  # regardless of which name they typed.
  depends_on :macos
  depends_on "MattJackson/tap/usagio"

  def install
    # No binary of our own -- usagio provides it. Drop a claude-usage shim on
    # PATH so muscle-memory invocations still resolve during the deprecation
    # window; it just execs the real usagio with the same argv.
    (bin/"claude-usage").write <<~SH
      #!/bin/sh
      exec "#{HOMEBREW_PREFIX}/bin/usagio" "$@"
    SH
    chmod 0755, bin/"claude-usage"
  end

  def caveats
    <<~EOS
      This formula has been renamed to `usagio`. `claude-usage` on PATH now
      execs `usagio`; please switch when convenient:
        brew uninstall claude-usage
        brew install MattJackson/tap/usagio
    EOS
  end

  test do
    assert_match "usagio", shell_output("#{bin}/claude-usage --help")
  end
end
