class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.f2824ee"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-f2824ee/threedoors-darwin-arm64"
    sha256 "63428714e91f48a43f861e4b934ba9b8678da933fcc08fb0eec736cb5bf79f51"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-f2824ee/threedoors-darwin-amd64"
    sha256 "e37758a2f80e2cf2087583418251c000f5ce6cca6f9677c2cdcee69bd6e2c88e"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
