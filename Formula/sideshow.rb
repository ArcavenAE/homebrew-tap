class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261128.024203.c4bb1ec"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261128-024203-c4bb1ec/sideshow-darwin-arm64"
    sha256 "6973057fa361ef31e0dcd8ecfe658e2d74cb39e8d6edcecd65f67d3e02e258d6"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261128-024203-c4bb1ec/sideshow-darwin-amd64"
    sha256 "7055cb14a9e035f088a9ecdd72771db6956b9ecf7ba4e39ad7818b038b2298d0"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261128-024203-c4bb1ec/sideshow-linux-amd64"
    sha256 "42a0c92274db7c4e61605b259217fb408bf4e430c07eb582d9f42fd373eb78ea"
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
