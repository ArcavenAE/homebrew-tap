class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.111539.725493e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-111539-725493e/marvel-darwin-arm64"
    sha256 "4ce980f647f8f3060ca06c4e7a858d25a31437160ebefb22f6d988b252c39a61"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-111539-725493e/marvel-darwin-amd64"
    sha256 "0263b4089bec118a86d992961c17aaab12640e2b2caf51036fd0fbe9968a061a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-111539-725493e/marvel-linux-arm64"
    sha256 "41aa09f11e28819494e0a90f5a2674f848ef95b14c76bc9fd5b30be7c447aea7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-111539-725493e/marvel-linux-amd64"
    sha256 "e6812351dcd101a231ddfdbd237cd8a71648163f944af73d233202f2a2ace3ea"
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
