class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.225842.061eb50"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225842-061eb50/marvel-darwin-arm64"
    sha256 "2cb6b3f5663daad351652a98b90e1dcc7991f4eabbb52115bf7212daf177ea60"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225842-061eb50/marvel-darwin-amd64"
    sha256 "ac557eee8008db8f520a4f9a02cc5f6ea86fdc4497d4988ec21ee94da07e9f41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225842-061eb50/marvel-linux-arm64"
    sha256 "6556d72df5fb32f167172fa2d9b157fb2c8eb703f2bb255809203b33de8caa3e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-225842-061eb50/marvel-linux-amd64"
    sha256 "e72192bc3b610bb4ac13ed16cb3b3834ef8a7290e38c12c993b616c5fb42bec9"
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
