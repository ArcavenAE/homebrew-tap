class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260712.232640.80b2273"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-232640-80b2273/sideshow-darwin-arm64"
    sha256 "0aa4ff2e0cf3b3fa1fed8ecb9c20e3938b8e71a65126a0dda8ab623191d5ff32"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-232640-80b2273/sideshow-darwin-amd64"
    sha256 "ffcfc117581ba62568b1afb6d693b128754ce4044873bf28df7bef614602fd20"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-232640-80b2273/sideshow-linux-amd64"
    sha256 "8613e4cdc20c227ca0449e1291344ce732c4bc62c4800860fe604e600bf69cb7"
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
