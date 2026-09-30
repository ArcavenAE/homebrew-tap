class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260930.045226.c33fdd2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260930-045226-c33fdd2/sideshow-darwin-arm64"
    sha256 "2870b07e12a3d60cb32caa5c6621ae1242a7508a5b1e0a20e5408aa9f1a94356"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260930-045226-c33fdd2/sideshow-darwin-amd64"
    sha256 "12ae52cabbaaade3a5560af8e79f566cc46350e3b77418c000405ae523dfb777"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260930-045226-c33fdd2/sideshow-linux-amd64"
    sha256 "dde5962b3464625adcc49c923b4aef3e216e1b123df13abf24b304abec7e52df"
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
