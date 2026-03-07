class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.e888f70"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-e888f70/threedoors-darwin-arm64"
    sha256 "a59a2b21d6cfc968441ab9e9ce6f6a8cae5a86b7b6d2e08822a5598cc197cfe7"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-e888f70/threedoors-darwin-amd64"
    sha256 "43d671e10a556491767a49e9352cdaf26abff39e14418d83f826d17d2a003723"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
