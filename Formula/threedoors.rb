class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.6eb9296"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-6eb9296/threedoors-darwin-arm64"
    sha256 "700196d71bced48f8613ea08c8f3111b8c4fcf90b9d491f54bceca3abf556de2"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-6eb9296/threedoors-darwin-amd64"
    sha256 "2452e134f3d031b9bedb98af353a63f295b68aac96a0a7f30ecc1b3b00bf301d"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
