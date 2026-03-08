class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.0dc50d0"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-0dc50d0/threedoors-darwin-arm64"
    sha256 "0615aea5cd8b617e238a65bc0070dabb6615f108e028e8855b9a241f42482408"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-0dc50d0/threedoors-darwin-amd64"
    sha256 "c63622f651061bf510a6aed4e2db1fbbf27562ee1b625eb8ab6c1cacd4033b37"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
