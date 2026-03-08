class Threedoors < Formula
  desc "Radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.a2e8ffd"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-a2e8ffd/threedoors-darwin-arm64"
    sha256 "072c996eccc06fe2e006e7a3984a9d35e9fd4ebc2cb8ee81da281d23af51f138"
  else
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-a2e8ffd/threedoors-darwin-amd64"
    sha256 "549233bd8a3c021e623f1d8f1573e0ba73ffe22770bd06b622409acb3a9a6f07"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1")
  end
end
