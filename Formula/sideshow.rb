class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261021.011112.c5962a7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011112-c5962a7/sideshow-darwin-arm64"
    sha256 "5f72408e2db566cb0cc28e8255a291c16a9426cf4b1b33da5ea62a1beae19ce3"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011112-c5962a7/sideshow-darwin-amd64"
    sha256 "4cbbc37bd82b1cc1f44b97219ee801ef5a04503cd69034a3c81c3399b8f8055c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261021-011112-c5962a7/sideshow-linux-amd64"
    sha256 "48bec19acaec65a9edebc79d56b56068e6c4287e9ffe1a61df72017cc4d1e545"
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
