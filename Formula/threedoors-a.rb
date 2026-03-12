class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.015740.5fc1c7a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-015740-5fc1c7a/threedoors-a-darwin-arm64"
    sha256 "dbddb4398c82bb0503b00f6533d1483ff61ea42b77087034de72a9c55840cc20"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-015740-5fc1c7a/threedoors-a-darwin-amd64"
    sha256 "c3a88897e856ece5a31ad7f483ecb42029184662d7bad7fda3d5cbe71d649731"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-015740-5fc1c7a/threedoors-a-linux-amd64"
    sha256 "f018df91a588dff6ee1dc1d26208fa4d6937b89faddefd4f296267ea50099759"
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
