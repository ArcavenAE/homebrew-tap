class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.d4109a1"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-d4109a1/threedoors-darwin-arm64"
    sha256 "a111c069d8297b56e91710e7c2739b565c79e564247ca41fa0264dac8bd4cd94"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-d4109a1/threedoors-darwin-amd64"
    sha256 "4904bf00c4670b7cf1138981f4a37e71640f7cfcaab1997726199eb781a69f6f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
