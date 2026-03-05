class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260305.c6ba9f5"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260305-c6ba9f5/threedoors-darwin-arm64"
    sha256 "c129f61e7a1af94ed35953f4efb0d45108349f90fe4860dba22fe81723e8de74"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260305-c6ba9f5/threedoors-darwin-amd64"
    sha256 "2cf9b5715a8da495524f042a1892be85d45182525fa7b0b1aefc7d5b61bd4131"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
