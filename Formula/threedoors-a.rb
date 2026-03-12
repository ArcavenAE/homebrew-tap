class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.224533.b41633d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224533-b41633d/threedoors-a-darwin-arm64"
    sha256 "852877a1a2ccddd8176cee7fc5a43f91b5ef2e42b70a6fc3e021820b5859ae98"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224533-b41633d/threedoors-a-darwin-amd64"
    sha256 "fca2fb4c9dee580fa76fc122c9a2e17c96593893d5c2b11e4f0c9ec78af9645d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-224533-b41633d/threedoors-a-linux-amd64"
    sha256 "1a4c3325efe70ed670b08eba9926df542c1c3f7b875fe7ea7775ac3b2ada4048"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
