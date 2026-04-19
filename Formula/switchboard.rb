class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260419.c1ac2aa"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260419-063040-c1ac2aa/switchboard-darwin-arm64"
    sha256 "a2eab30974d80fbb8d7bd0d159555a4937ec3012d07db5ac2d65908b52aa88b3"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260419-063040-c1ac2aa/switchboard-darwin-amd64"
    sha256 "271e4694b2fad9ea587a765932821f85531584094e3c0d8a91efde0a7fee0b3c"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
