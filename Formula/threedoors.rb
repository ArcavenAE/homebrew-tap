class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.7ce632b"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-7ce632b/threedoors-darwin-arm64"
    sha256 "06cb86d090d224038b8af30e37833e75e9c014f21e4f8844a28f8efd6e523bd4"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-7ce632b/threedoors-darwin-amd64"
    sha256 "0e5885f040d821774dfdf41dc4ff5b75022eaec36857249ad664b618ae95321e"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
