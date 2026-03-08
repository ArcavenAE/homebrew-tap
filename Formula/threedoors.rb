class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.af085a2"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-af085a2/threedoors-darwin-arm64"
    sha256 "6ecf14594aa442b284c09be70c4c49952877cde3e51b5bb55d8e0db2236b9fae"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-af085a2/threedoors-darwin-amd64"
    sha256 "814c51fedccd070fdb641d12339e5f8a7cc72f396f9dc89c50cb19f763739cb0"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
