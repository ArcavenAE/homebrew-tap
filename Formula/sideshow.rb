class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260928.131658.1725c12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131658-1725c12/sideshow-darwin-arm64"
    sha256 "0d36c193098c67e62602dc410eb3771ea48d2f8b80e61e89407396c06172c93d"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131658-1725c12/sideshow-darwin-amd64"
    sha256 "d8b82dfac23657e651fe963499ef00caac33929f7fe4d16893edb2e5b75f48cf"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260928-131658-1725c12/sideshow-linux-amd64"
    sha256 "35f4b688aaba8ac2862d23579cb595694bdc5d746703544fa6c179f7843058f8"
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
