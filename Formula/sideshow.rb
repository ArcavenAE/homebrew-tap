class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.225013.6b5b01f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-225013-6b5b01f/sideshow-darwin-arm64"
    sha256 "8f67b8283ed6cd94f45cced9594dd6a980e14ec259eb174550bb75946b5f11a9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-225013-6b5b01f/sideshow-darwin-amd64"
    sha256 "833a905d602c927fd3e4bc16dfef559ce06ed45d8d0674c4d84554e6d385fd8f"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-225013-6b5b01f/sideshow-linux-amd64"
    sha256 "c70713d0fc1b0b9d53e04b237f73e0376d30353cce191ddfe2addca9e978b1ef"
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
