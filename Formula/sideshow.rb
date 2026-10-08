class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.093216.a2c557f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-093216-a2c557f/sideshow-darwin-arm64"
    sha256 "f0146ee4d9c38fa80d4049faec2ab45de3f1466dc48ec46ca8cb6df25ce5f1fc"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-093216-a2c557f/sideshow-darwin-amd64"
    sha256 "b5417fb02734a3a371d090bcb82107c5ac9224f6821f1d41d8f955a220ff413a"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-093216-a2c557f/sideshow-linux-amd64"
    sha256 "989f82ae5f05ab5d5e3b58f604fadc961dc3e429f4ac328000cd9458e64ba526"
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
