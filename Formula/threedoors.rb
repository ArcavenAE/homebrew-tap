class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.81bebc5"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-81bebc5/threedoors-darwin-arm64"
    sha256 "4348e0a1fffd0637983827d5e6a555507f1856ca30bd63cba9baf7eab3cd9faa"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-81bebc5/threedoors-darwin-amd64"
    sha256 "66a7e7bf3dd2100943694d21b51033f117f988b088d438ebe58e6d98ca30a791"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
