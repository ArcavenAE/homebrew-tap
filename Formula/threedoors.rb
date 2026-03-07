class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260307.b97cd50"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-b97cd50/threedoors-darwin-arm64"
    sha256 "d21a55157ac14a5e6a3e6976ec27290d157c7de9b653772d6c2fa870a62fde86"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260307-b97cd50/threedoors-darwin-amd64"
    sha256 "0b9e9cc84faba534ce3bb01d698f8727eb16c72f4a04ca531c7f47e74c981638"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
