class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.86d5de7"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-86d5de7/threedoors-darwin-arm64"
    sha256 "8d5682b80dd78c568a0c1dd08752c7e3fbf0b9ddb33acde30a62b8ab0e6f1bc0"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-86d5de7/threedoors-darwin-amd64"
    sha256 "e5ef364d01d6b779da51e3c017d5d73b2be417626b0d1ae899b803de5cd6c3ad"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
