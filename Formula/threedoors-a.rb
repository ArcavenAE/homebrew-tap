class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d2b327f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d2b327f/threedoors-a-darwin-arm64"
    sha256 "c32bf3d10db7bc6937ab79445a9e17e01ddf1f588e3fd1d0dcb9f60d6c7f2c24"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d2b327f/threedoors-a-darwin-amd64"
    sha256 "79ab954d6500845601120e71027626c26019a6746c0fd0107b210943c47b5b03"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d2b327f/threedoors-a-linux-amd64"
    sha256 "7304272f43262fcf9917b7f8c7773f3f41b43c5be4aa7c1e59a7badae671bb61"
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
