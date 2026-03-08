class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.cb7e633"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-cb7e633/threedoors-darwin-arm64"
    sha256 "8442772cdbbec951a2a23adb8c446c2801f32e79a4ae75ca301a00f0a9a7484b"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-cb7e633/threedoors-darwin-amd64"
    sha256 "723dec79c8bd683d6da34dc5ff3f5c4e096d05c97b27328039d3698cbaf44b01"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
