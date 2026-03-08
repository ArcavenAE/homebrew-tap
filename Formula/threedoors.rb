class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.9578d2c"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-9578d2c/threedoors-darwin-arm64"
    sha256 "024dab2f0e0a9989d4d38dd6b7e0168124f855d060f498173fab200db30846e1"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-9578d2c/threedoors-darwin-amd64"
    sha256 "bb238df5d0651b4a7861edebf073232edd9d755c27669369e94d31a6b00efba7"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
