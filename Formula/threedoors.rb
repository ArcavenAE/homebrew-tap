class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.181c011"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-181c011/threedoors-darwin-arm64"
    sha256 "595f66403b7ffce45441d3c45ba32e5782153be4270335bd9c08dc34587c33f1"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-181c011/threedoors-darwin-amd64"
    sha256 "f4a957cb0a05fcd9c54ff8bc2417616b2ed967d7ea1266c5f1da07393b737955"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
