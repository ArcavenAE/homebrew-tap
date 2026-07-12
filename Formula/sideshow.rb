class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260712.204033.9a250fd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-204033-9a250fd/sideshow-darwin-arm64"
    sha256 "daeb44eecb817b69ae40e60e212bd3c10b7499dcc7cdcc07a2d50b694b2a9c6d"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-204033-9a250fd/sideshow-darwin-amd64"
    sha256 "db65b4bf01ca4a7fde80f27d81a6bde69592fce3e5fbdfc37cd5f7b108803d44"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260712-204033-9a250fd/sideshow-linux-amd64"
    sha256 "17f17bbf0ae39548097b69a286b96976ebe987ef00a44b08351611577210f63b"
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
