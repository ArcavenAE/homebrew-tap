class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260405.54f5b0d"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260405-062527-54f5b0d/switchboard-darwin-arm64"
    sha256 "b7205555f90d57e244a430c6bd52fef273b7a833e8b756ae825dc3388e2ef357"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260405-062527-54f5b0d/switchboard-darwin-amd64"
    sha256 "33a687555bafce88897c96f416a2aabd0a21cb81601961a6eceda3cf9e826a39"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
