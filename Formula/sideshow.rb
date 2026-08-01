class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.001839.f4a408e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-001839-f4a408e/sideshow-darwin-arm64"
    sha256 "d59b7739f333086c5d390238887e81ef6cdd54df644a7710c0d6745afc99db67"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-001839-f4a408e/sideshow-darwin-amd64"
    sha256 "c225d5c5bcd7c08f94b7a8e3bd95118d51c593b0e73a028c993c47ab70405b99"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-001839-f4a408e/sideshow-linux-amd64"
    sha256 "850709c0bc57888cb38e2a1ca43df18066d12a4d93b9130476ae91537ce8f5dd"
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
