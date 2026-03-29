class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.170649.eb7c7d8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-170649-eb7c7d8/threedoors-a-darwin-arm64"
    sha256 "98a51b6c09ac76923f935c27397b0b2c6c699d2a1f377d42f31eaaf83942e194"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-170649-eb7c7d8/threedoors-a-darwin-amd64"
    sha256 "c52b0f451b415397193147dcce10eb1d1fce5679ba60b80ca540976ff166bdb5"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-170649-eb7c7d8/threedoors-a-linux-amd64"
    sha256 "522674d510624ea8ed1278e7348708a544436bb926d7dad6fb2b3db576612f05"
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
