class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.9ae4e74"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-9ae4e74/threedoors-darwin-arm64"
    sha256 "072b38593ad092a16fa82bbc73474e4abe2e01f4fddd1335cca6eea2c63f01b8"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-9ae4e74/threedoors-darwin-amd64"
    sha256 "12b1019a0e17abb034e614d8623db94664d28ee3d3558269a703a979bce957ef"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
