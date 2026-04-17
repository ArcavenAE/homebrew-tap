class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260417.ac9b68e"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260417-204349-ac9b68e/switchboard-darwin-arm64"
    sha256 "00c266e1a462af550c8ceeac053014b1346989162eeb3f16eda64430f36e24cb"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260417-204349-ac9b68e/switchboard-darwin-amd64"
    sha256 "f79865f405a79145508bfd92f7f2ab9a8bb4a8a413fa4060b6999608c0855a29"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
