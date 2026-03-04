class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.385fcaa"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-385fcaa/threedoors-darwin-arm64"
    sha256 "2d0ae1ca76af21e8b2f51d2b418afc5ff5be7890bde6124d5ba387d0fdf09017"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-385fcaa/threedoors-darwin-amd64"
    sha256 "4edace1c5ce6cb77d16f9ab3cda0d437e657dfba7d81c8d8324e8673ab85c8d6"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
