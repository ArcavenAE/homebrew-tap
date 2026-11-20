class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.013735.ca29698"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-013735-ca29698/marvel-darwin-arm64"
    sha256 "a204e090e3bc5be6e6001ed9563b909080fafb002aaed519cdd3718d242031d9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-013735-ca29698/marvel-darwin-amd64"
    sha256 "c4c95e7fbbb5c56093729b9af22531cbffbff68ce5cdfe5884592698eb056651"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-013735-ca29698/marvel-linux-arm64"
    sha256 "30f937bb7d855faffc6a7145606cf78440b4cade919859cbaa48ca50b2234a96"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-013735-ca29698/marvel-linux-amd64"
    sha256 "cfcf67345a57097e03303726a12eb9c0441a0847dc2b6cd9809a53a7d66af797"
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
