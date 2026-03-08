class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.35efbf6"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-35efbf6/threedoors-darwin-arm64"
    sha256 "81fe7c8dffc5a9bcc2c72a22bda1a7ceac1d9cfc19cd966320ff5aa2b236d82c"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-35efbf6/threedoors-darwin-amd64"
    sha256 "12534052c420fe061c0e072596e06684b2bbf9cf48dd53179d0f2053408d64e2"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
