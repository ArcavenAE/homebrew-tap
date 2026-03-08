class Threedoors < Formula
  desc "Radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.13c3b73"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-13c3b73/threedoors-darwin-arm64"
    sha256 "4649a09380f958029bee590f2eb76b4f51fad75bb31c55ed08de6fa7fe3a35b2"
  else
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-13c3b73/threedoors-darwin-amd64"
    sha256 "e89662f643ff50ed5b203eeb099a97c284e7fc7868da5647e4b1fa6aefa86b60"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1")
  end
end
