class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.a8cee23"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-a8cee23/threedoors-darwin-arm64"
    sha256 "802a53621cce436424d4c0875b0173b85e296b9ff7190862394ec9d4c2c46e6e"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-a8cee23/threedoors-darwin-amd64"
    sha256 "44f08aa803d69eea51b8ee40808b49f8230c60cd22162bde6fa8a62c930d9464"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
