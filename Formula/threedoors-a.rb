class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.230807.8549d0a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-230807-8549d0a/threedoors-a-darwin-arm64"
    sha256 "fcedde2e720d17304ec688c56feee3755f8ad743f7241f519d1f9ebf1bd1e488"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-230807-8549d0a/threedoors-a-darwin-amd64"
    sha256 "de5cef2e2b377520ed801d4227aea0838cfb75684e208148df62dabcaf125dcc"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-230807-8549d0a/threedoors-a-linux-amd64"
    sha256 "446d07ca5199f31447e11abd4589ef9825874d6d5c3cd49761b58f40607a2dcf"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
