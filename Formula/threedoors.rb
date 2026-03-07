class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.32bc1f9"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-32bc1f9/threedoors-darwin-arm64"
    sha256 "4c6b053ba2b195f01f376ed531ae13c8dcfc5f08710708b6bae4b2f98e83293d"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-32bc1f9/threedoors-darwin-amd64"
    sha256 "e33b3a0f0b547f14b201de8555bb5729a4d7581731d20e805f871b22fa500053"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
