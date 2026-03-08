class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.a459a68"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-a459a68/threedoors-darwin-arm64"
    sha256 "83f166ba5333e61b6164fb1e1c5a57a2a14141a1ce6558c4719213c307a4f5d4"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-a459a68/threedoors-darwin-amd64"
    sha256 "98a545e4c8b54f1609fc0da2ca1bb17c7a405624055d0934733a51c787eee938"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
