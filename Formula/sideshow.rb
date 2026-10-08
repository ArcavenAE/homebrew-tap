class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.070215.4b695ce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-070215-4b695ce/sideshow-darwin-arm64"
    sha256 "6582fbc4950eee9acf63c6632401220270133f29eed2a69b7456163228c2746a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-070215-4b695ce/sideshow-darwin-amd64"
    sha256 "e19ab4d94fd1b50fd419f0272ec07c6b2cbf3c511dfd8b95051a06d899bb7498"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-070215-4b695ce/sideshow-linux-amd64"
    sha256 "8add4139131f1ee78a661f2ef74f22a4fbb4c8c15e0bc266c4700ab1c781b803"
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
