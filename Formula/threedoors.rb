class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.ca37544"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-ca37544/threedoors-darwin-arm64"
    sha256 "64a3e7ddbc0af96b4f27196ebe3112331dfb9bb6a707057c5fc7f54a087b5427"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-ca37544/threedoors-darwin-amd64"
    sha256 "836ff3b7d034a1f00a3eb2fad5bf92d236a53bc45995671b6dbbb667e746a807"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
