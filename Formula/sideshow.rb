class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.235003.4a60acb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-235003-4a60acb/sideshow-darwin-arm64"
    sha256 "c1d58bcb39c3d6b7bd0759d15e4f89c7320f10503cd70f613c5147eeb7e3e81b"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-235003-4a60acb/sideshow-darwin-amd64"
    sha256 "5e400521e386f6cfade4473568e761fb3cc6e01bc7a2b19c89fe06186b6e0b83"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-235003-4a60acb/sideshow-linux-amd64"
    sha256 "790766adbda34e085c410a3324d9aa494399d572119615f306858f3afcf023d0"
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
