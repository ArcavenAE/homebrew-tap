class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260813.8672b2f"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260813-092237-8672b2f/switchboard-darwin-arm64"
    sha256 "36ff318b5fb86cf95ce924388df3066ca1d7fd228ecd75e65cf5c49f571be8e5"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260813-092237-8672b2f/switchboard-darwin-amd64"
    sha256 "b5b9c3c591bce63c4c989c5b7c641c2075c0f40c458233d6013a02d2b15ef8b4"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
