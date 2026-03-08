class Threedoors < Formula
  desc "Three Doors - radical task management showing only 3 tasks at a time"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260308.5f060cc"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-5f060cc/threedoors-darwin-arm64"
    sha256 "742e241a01b75ad805945ffaa047741109436905534c6c99f3b47e7e6bda3f09"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260308-5f060cc/threedoors-darwin-amd64"
    sha256 "bfc0655d69ab70a135c21925e78c33070ac1fcc14de3542ba3a59bd379235c67"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "threedoors-darwin-arm64" : "threedoors-darwin-amd64"
    bin.install binary_name => "threedoors"
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors --version 2>&1", 0)
  end
end
