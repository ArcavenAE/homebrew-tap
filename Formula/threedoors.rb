class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.5f1b3a4"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-5f1b3a4/threedoors-darwin-arm64"
    sha256 "4b58c92e7705da3f93d761f3047a8445bcd21c1ebbebefe4eecd2ebe13bd8d79"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-5f1b3a4/threedoors-darwin-amd64"
    sha256 "50038c834695a4444298d51c2a4555bf3981e1e68fa971e683309e3238d54077"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
