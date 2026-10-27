class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.180050.63eb38a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-180050-63eb38a/marvel-darwin-arm64"
    sha256 "aa10c955460bae2d1ca9521b57ac9fc5f09fe5b76291a772d9e45de10a24cc64"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-180050-63eb38a/marvel-darwin-amd64"
    sha256 "280e7b32f44dfc14829c646defe7b13dc0cd53a3466e752194aa1b156ebf238e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-180050-63eb38a/marvel-linux-arm64"
    sha256 "7bbaa7e234d51c8c81d91df7b62c673bee021827c451a42dd176b699242b701e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-180050-63eb38a/marvel-linux-amd64"
    sha256 "16ce89813f3a6527a07c48a08ac1b39273bf1a843fef2d9efce7f7181e5f6b3c"
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
