class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.120513.889e49a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-120513-889e49a/marvel-darwin-arm64"
    sha256 "2100950534eb0963eb75871cc976ff8c0225e53c02482a889520a10bcd4ddb58"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-120513-889e49a/marvel-darwin-amd64"
    sha256 "f5a741f2728028970517803499e66b1c673499d2ab37bc0907ac40633913bbea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-120513-889e49a/marvel-linux-arm64"
    sha256 "977c89902cccafcc234849d36766cfa275b7b06f29292764d13f1f474a08bc34"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-120513-889e49a/marvel-linux-amd64"
    sha256 "f45ec18bc08ffee9a44b7dfe68ac1c9edff124fb37e3f8b770656797b3c9ee87"
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
