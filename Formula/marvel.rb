class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.170107.b095f5e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-170107-b095f5e/marvel-darwin-arm64"
    sha256 "3d60aee700001f9c14db991a0590d25efeb353644e18c9e2492ec8698194d1de"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-170107-b095f5e/marvel-darwin-amd64"
    sha256 "7309987bed9f29d0d1e1498e7343242bb61f91846cb5ee96f157b64bc1365e35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-170107-b095f5e/marvel-linux-arm64"
    sha256 "1b83d621315ad85191440290000c2d0b5bae0806efc6398518ee1d7df012e2f1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-170107-b095f5e/marvel-linux-amd64"
    sha256 "460763b18e872126dfc5286b7b3e08f440ff443bf2d19cc382598a4a264ddb43"
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
