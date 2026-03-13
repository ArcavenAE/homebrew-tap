class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.151237.d0d5fff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-151237-d0d5fff/threedoors-a-darwin-arm64"
    sha256 "93e06087112f928703fe6ef1ecb242ad515698e2da3a1090794ac29dda9ed232"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-151237-d0d5fff/threedoors-a-darwin-amd64"
    sha256 "ad0fbf587160804f88072f9e9ae1ef4b8398b541d40de4a81131c9830bb2c272"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-151237-d0d5fff/threedoors-a-linux-amd64"
    sha256 "1672950cb025c098678a8b01a76bc88b74b85d5b889e54a61e5d80c81e7a6572"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
