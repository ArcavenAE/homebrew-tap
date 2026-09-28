class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.042114.b64b859"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042114-b64b859/marvel-darwin-arm64"
    sha256 "366558740c62b57d22a9063db1256062090618821c9e6d7d8654d41a09c248a7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042114-b64b859/marvel-darwin-amd64"
    sha256 "4c98d413c34bee9360143decda36928aa5b472bdf7e4b4949973752d15aa6f1d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042114-b64b859/marvel-linux-arm64"
    sha256 "63f62358fcadaa54e99d17b0fa1a7edbbece97899ddfe20f5968b8d476535316"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042114-b64b859/marvel-linux-amd64"
    sha256 "0a1345db221f04b9c68b6e542dd3900da17a305b2aa6b5ee3c91c0d22402ec3a"
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
