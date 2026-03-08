class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.59bfc12"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-59bfc12/threedoors-darwin-arm64"
    sha256 "8c0ca1ee1b3c2f4c3ca2585db764ca206537003c56deca78d8001b0c19745bf9"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-59bfc12/threedoors-darwin-amd64"
    sha256 "1edc196a9087b7dc17a1eb41a2aa0ba351d350a4582acdc16601350d85c71c1f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
