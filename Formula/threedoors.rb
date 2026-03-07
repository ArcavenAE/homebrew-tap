class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.0b5591d"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-0b5591d/threedoors-darwin-arm64"
    sha256 "5eb5395b32e8fe1e132645ba9a30ffdde61257caf64f5b4a6b89ff14998533d4"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-0b5591d/threedoors-darwin-amd64"
    sha256 "24f7180d5745b87880702c960afaf4d1992bf760013311dce9cc1907a59ea729"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
