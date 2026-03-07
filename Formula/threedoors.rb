class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.94887ef"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-94887ef/threedoors-darwin-arm64"
    sha256 "99c51c328f85236cac33bc18e70ec4cfa07ad50094e82b0ca92e3aded6d90778"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-94887ef/threedoors-darwin-amd64"
    sha256 "979b65773a3cad543bb95654e7a2e63f37f4559f08dd0058543c0b978784f3b3"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
