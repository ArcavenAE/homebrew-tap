class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260513.ac00fe4"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260513-032557-ac00fe4/switchboard-darwin-arm64"
    sha256 "8e1d04b6362c79f284f184cd16a4f6361823e9b71b004b3c18f931d3fce36e6f"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260513-032557-ac00fe4/switchboard-darwin-amd64"
    sha256 "840a4dd42b7b3b25cf6c972747055ea97baf2999d9c13b010faf190ed59e1906"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
