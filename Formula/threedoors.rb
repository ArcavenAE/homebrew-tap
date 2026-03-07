class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.4b63885"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-4b63885/threedoors-darwin-arm64"
    sha256 "5301e5a13317ef4c3ce80a5ff09c0e1f898968bf8b623f456160d6f58b5771fe"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-4b63885/threedoors-darwin-amd64"
    sha256 "8f57668130466e9ff66d51bb60fedbd6434042bf339729a79a84ca9f8a6ea77c"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
