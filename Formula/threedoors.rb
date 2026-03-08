class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.a81c8a1"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-a81c8a1/threedoors-darwin-arm64"
    sha256 "243dbabf1b7cc9bc5d78c67ffaa6d11992f26ace11546fea3fe2a2e665cc298d"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-a81c8a1/threedoors-darwin-amd64"
    sha256 "35291528dafa9088a721765acf2dc0f067fcc2a790ad63495f2bb4a5ef963fde"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
