class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.155301.7ddaab4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-155301-7ddaab4/threedoors-a-darwin-arm64"
    sha256 "874db1470b14993ac9d8e37233520c01eafff33ab991cc6ac59a3005acbe575c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-155301-7ddaab4/threedoors-a-darwin-amd64"
    sha256 "2e4d5531c80c95708e8d5084f71c8b17c67c840f8d2eb88fcbce136ee1c1b455"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-155301-7ddaab4/threedoors-a-linux-amd64"
    sha256 "e1318100394ab9af97504d7bfa2f142cd9a169baad158557601db4e67841c069"
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
