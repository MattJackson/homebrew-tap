class Fwext < Formula
  desc "Generic firmware extractor: any vendor download in -> raw firmware .bin + JSON label out"
  homepage "https://github.com/MattJackson/firmware-extractor"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MattJackson/firmware-extractor/releases/download/v0.1.0/fwext-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "2fc0ab08602c25121d928dab3eaaa2a18853ea61f2a1d5237a511a0a4f5c5ea4"
    end
    on_intel do
      url "https://github.com/MattJackson/firmware-extractor/releases/download/v0.1.0/fwext-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "0cf9363663975a1c3f41db00881838eb23a756cd16aeed86f01e9128dea6bae1"
    end
  end

  on_linux do
    url "https://github.com/MattJackson/firmware-extractor/releases/download/v0.1.0/fwext-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5ddad4ba1907311c7ea9fc5a8327975caa299edd77370d7cc589dcbdd9ae2183"
  end

  def install
    bin.install "fwext"
  end

  test do
    assert_match "usage: fwext", shell_output("#{bin}/fwext --help")
  end
end
