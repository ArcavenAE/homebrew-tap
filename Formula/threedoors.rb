class Threedoors < Formula
  desc "Radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.90c79bf"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-90c79bf/threedoors-darwin-arm64"
    sha256 "b933fb3278b8614b7c0fd1dfece1afe21470dc2e17a1a467a0d7a666f5f30a45"
  else
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-90c79bf/threedoors-darwin-amd64"
    sha256 "786dee95896ab4f581e0bd731a92f3bb99f2f8ad050626a4e173c85b5b9bea2f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1")
  end
end
