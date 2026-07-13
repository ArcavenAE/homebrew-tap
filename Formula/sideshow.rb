class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260713.012313.4d9d181"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-012313-4d9d181/sideshow-darwin-arm64"
    sha256 "5ff143da3c7f27a3f592639da2a3f1ad4650a376f37bc1f5b8515610ab7fba77"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-012313-4d9d181/sideshow-darwin-amd64"
    sha256 "e8ff6ebceea64c2ed32be614f958646bac7368d9a36fa2318a239af244c1bcc4"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-012313-4d9d181/sideshow-linux-amd64"
    sha256 "8036d23463dd13a1979e70436abd08deafb83d57a85a2bdb2314a620ea218a05"
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
