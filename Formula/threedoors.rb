class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.54072fa"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-54072fa/threedoors-darwin-arm64"
    sha256 "b1403a5736160540deda036a16f613ede4dbfcd76821e65d4e745ab00a860649"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-54072fa/threedoors-darwin-amd64"
    sha256 "4927d14cdacda7fd2723b54f58b09def91a61dafdd5f9d8434575f29d79ee14b"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
