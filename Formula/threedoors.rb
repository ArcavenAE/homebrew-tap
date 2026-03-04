class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.5db82df"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-5db82df/threedoors-darwin-arm64"
    sha256 "5653a60220470768e4e01080ce5fd018cf8f4de2dcd0b1153b0d3c476dc94bb0"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-5db82df/threedoors-darwin-amd64"
    sha256 "9a1be2a85ce9730af530fd23f6efad3ef3669ce2a8960e3d38235afeee894e08"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
