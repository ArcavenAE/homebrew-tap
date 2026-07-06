class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260706.98de12d"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260706-015618-98de12d/switchboard-darwin-arm64"
    sha256 "6224c0ddcfa1409b69734dfac5b9246e7a5b23a25e773b115f6dd80457ef4381"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260706-015618-98de12d/switchboard-darwin-amd64"
    sha256 "e026da76a426788b1271d83ee492173b29667b2ca6f7d5fe49c40e64d57e7489"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
