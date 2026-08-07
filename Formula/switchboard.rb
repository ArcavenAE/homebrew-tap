class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260807.33df548"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260807-075832-33df548/switchboard-darwin-arm64"
    sha256 "233191707d4dc1f81191aae42f297b92e27f9a5bcda67a61bf9840ad3b7ffa9e"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260807-075832-33df548/switchboard-darwin-amd64"
    sha256 "f15c405a34d0349e4a5e9bec4d157063204ebc59363990beced248a9357030fe"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
