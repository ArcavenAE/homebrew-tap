class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260304.df238b5"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-df238b5/threedoors-darwin-arm64"
    sha256 "f13096b95e61225798e7ab8866e870f0f4d469353b9c5a5a2a1141cb185afc72"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260304-df238b5/threedoors-darwin-amd64"
    sha256 "06b7aa125043a78fa9bda02566f8ad8bf2da3f7da430d3f2fffa31661f18f8f9"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
