class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261113.061632.3556238"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261113-061632-3556238/sideshow-darwin-arm64"
    sha256 "3d90c2eb4ed8c1be043bacb827fb8834e7123281ab4cef72d6eaa2add1f5d2f3"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261113-061632-3556238/sideshow-darwin-amd64"
    sha256 "65ffe7b1a5dc774973a19c809f391b83d5089d1a333a09578212275cdc54935a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261113-061632-3556238/sideshow-linux-amd64"
    sha256 "d574dcf4183b7e1268856922d59f66e07fbc195c6993a358153370abe6cbf14c"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
