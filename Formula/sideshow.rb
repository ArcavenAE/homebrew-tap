class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260717.234553.34ae250"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260717-234553-34ae250/sideshow-darwin-arm64"
    sha256 "e2ffbacbc27dc0cbc193f302702b1fec275eb3774d558bdc2a557dc27ffdc2d3"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260717-234553-34ae250/sideshow-darwin-amd64"
    sha256 "659b34f2c3a9743b34ebff115cb75f151988fc7edec0fce7c92056cca43891e8"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260717-234553-34ae250/sideshow-linux-amd64"
    sha256 "79ca672fd27b42bfa75309cfe63ca1465654db4566dc80f40c00abda2f91b621"
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
