class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.043d62e"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-043d62e/threedoors-darwin-arm64"
    sha256 "770c5a453884075b30c899c2764dba5ce628a4ca9f35842ce5ca9318dcc855be"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-043d62e/threedoors-darwin-amd64"
    sha256 "4a3beb9f03a00eae253aea5aaca398ad6d70ae3f1cd05fe770d477d21a6a2f8f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
