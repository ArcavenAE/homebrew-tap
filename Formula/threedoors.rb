class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.c6de254"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-c6de254/threedoors-darwin-arm64"
    sha256 "4cc74211ef5033e5d77cb35a3cb227943240e21e35c314952c8b5d0b7799ef1d"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-c6de254/threedoors-darwin-amd64"
    sha256 "a4c154982d5ce05b1e31067d286a5d00b1a60fbfa006637d3a7361bac4c17f16"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
