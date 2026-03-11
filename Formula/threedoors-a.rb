class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.096c6dd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-096c6dd/threedoors-a-darwin-arm64"
    sha256 "2b55604a819e97119323a72f25dbaaf6b943fefb8e122e5085b3ec39d97b9413"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-096c6dd/threedoors-a-darwin-amd64"
    sha256 "e72399c865c2c7288a7fff7ae427345efa3aced23c889b0445be27e4ce5d04f6"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-096c6dd/threedoors-a-linux-amd64"
    sha256 "13cf1b0b76eeb4843a754464bdc25c0eefa81f770fefe886c66ce18ac2d6568b"
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
