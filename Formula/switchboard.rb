class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260717.7a9d745"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260717-170400-7a9d745/switchboard-darwin-arm64"
    sha256 "08883b85d1e006b07444428d95adc5116a0a3642298aad0ff2dea60e99d15419"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260717-170400-7a9d745/switchboard-darwin-amd64"
    sha256 "06c52448cf82263d92e9ab578bc9e1c1d4b86319608dc5b6effac27a75b8eebd"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
