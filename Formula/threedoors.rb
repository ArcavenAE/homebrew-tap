class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.fa8eb52"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-fa8eb52/threedoors-darwin-arm64"
    sha256 "7e475489111a08c79eac442d18952ec98544283bd4d5a683a93ccf6b6be17c7e"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-fa8eb52/threedoors-darwin-amd64"
    sha256 "9a6b3f9635150567bfd55b8f7e7a8cf11ada7ec69baf0eba0b2605b66bb22505"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
