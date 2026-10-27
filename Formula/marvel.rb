class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.060555.52daf3e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-060555-52daf3e/marvel-darwin-arm64"
    sha256 "f6fe056353524ba7b0b91de3096b123bcff83f22e4b10c172000a6c010f16cd8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-060555-52daf3e/marvel-darwin-amd64"
    sha256 "23125aab3bff6f54f97ac43407efc02e5312927d9a0faadd2431c3c579b685e0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-060555-52daf3e/marvel-linux-arm64"
    sha256 "60d7405937db778f64ef3c74dffa033c7f33842d5914e25c1fea08923dd352b0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-060555-52daf3e/marvel-linux-amd64"
    sha256 "cd5470de3c5978f36c995b21d9cf4407e9b445df5be32ecc57bc889ae706d173"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
