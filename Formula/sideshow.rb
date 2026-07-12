class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260712.200431.9634c9b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-200431-9634c9b/sideshow-darwin-arm64"
    sha256 "f5cdc29a516f2ec83c1bafdaeb516ad201f19722e1af74456e5f5453ce2312ca"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-200431-9634c9b/sideshow-darwin-amd64"
    sha256 "3708e642614a32b23350d28f95fe0b01d445c288b56d88de27a2bce05bae1b39"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-200431-9634c9b/sideshow-linux-amd64"
    sha256 "9bc793c6ca447ad4cb172ab7ed0f8bf53e2afc0b1eb6372f375baf1eaa4ea84d"
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
