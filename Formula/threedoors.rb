class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.6e6b15a"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-6e6b15a/threedoors-darwin-arm64"
    sha256 "732b2c7d37e367af6aef327bc1397a54235c4139c5de50321d4e8e0aede6600e"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-6e6b15a/threedoors-darwin-amd64"
    sha256 "7596c19e79ef0e44a4630b8f1a48456b3663ccdb5de99d9451e6c60d6a7ce464"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
