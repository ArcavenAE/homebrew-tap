class Threedoors < Formula
  desc "Radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.76c3a9e"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-76c3a9e/threedoors-darwin-arm64"
    sha256 "155ec390789d10e4e93e566cdd9e8b8d2b04b1e04a3fce914d4c1b30a3505622"
  else
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-76c3a9e/threedoors-darwin-amd64"
    sha256 "ac4e7b13b2f2ba9e4d7e0b4bc5bfb0b0c1955703537d1b0bc9355b7218088f94"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1")
  end
end
