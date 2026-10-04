class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.201934.b355df7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-201934-b355df7/marvel-darwin-arm64"
    sha256 "502c9cd20afd6102d7c6f479d6a4b077f1993603e3604e21b03f8e44060bca26"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-201934-b355df7/marvel-darwin-amd64"
    sha256 "0074221efef2bfe16ee6ded3486587674b156e32ebbfc21565633987331d2b0d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-201934-b355df7/marvel-linux-arm64"
    sha256 "87b95ba5fc63581935bb5ed42698043daf1dafae73424f9a684c4891e216e255"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-201934-b355df7/marvel-linux-amd64"
    sha256 "c8659655d116c61e344f3ab1d25cbb00c5c78f8184cc2158403395ec0782c724"
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
