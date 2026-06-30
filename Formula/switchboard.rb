class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260630.644b08d"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260630-020226-644b08d/switchboard-darwin-arm64"
    sha256 "102581187c207f27a14f70a0848d8fb14e356af9e5f9b49af9d837a4ccf67528"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260630-020226-644b08d/switchboard-darwin-amd64"
    sha256 "92b73bc5d712f6d26daf2a44b36eed1b71aaf993cf66ae7710e8b85b33826df7"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
