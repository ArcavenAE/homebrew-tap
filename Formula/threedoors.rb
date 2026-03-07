class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.9f0abee"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-9f0abee/threedoors-darwin-arm64"
    sha256 "db4a1532ee5c088d5d228f868cdb258d903aa3de4e092935a8da786dab75eabe"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-9f0abee/threedoors-darwin-amd64"
    sha256 "479f48f190ee70e007f5474d48e98c99e192291d638ce44ec83e560ebd61723a"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
