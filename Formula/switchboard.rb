class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260717.5dcca35"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260717-234719-5dcca35/switchboard-darwin-arm64"
    sha256 "41ed5d84e00ad4e57288498dad0e8dfcd175989db9eb518c5036c00879c6a5af"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260717-234719-5dcca35/switchboard-darwin-amd64"
    sha256 "158e52d933fe5e5a63e39ae79eb0e63b4da60e5984e22116faa0baf814c5554c"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
