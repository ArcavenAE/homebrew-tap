class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.023635.cba5c1c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-023635-cba5c1c/threedoors-a-darwin-arm64"
    sha256 "d90fe3f1678726647ea30985663a2e7eac40bde5ed8eb410e67e9b2271e3bd73"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-023635-cba5c1c/threedoors-a-darwin-amd64"
    sha256 "89d0a684b277ed880cf8e3fa6d03793176a6602f7b0a28a30005bb5ebb5a399e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-023635-cba5c1c/threedoors-a-linux-amd64"
    sha256 "d36b2ed7f53f9457dfa19e00581daae155d6a840340df53adea0577b465c813b"
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
