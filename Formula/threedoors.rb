class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.c1642fc"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-c1642fc/threedoors-darwin-arm64"
    sha256 "134ae7f31dd9fdf3791af142ee3fd5a4b68d9fcc1635c6651059c4ae8dccbcd3"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-c1642fc/threedoors-darwin-amd64"
    sha256 "ec53c911ed922281e66da1beac0208acd997d04a21e48d8c84b486dd1d67ca72"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
