class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.031601.bd47be2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-031601-bd47be2/threedoors-a-darwin-arm64"
    sha256 "c5cfd902c1a52fbc5580a35a3b999e461cfdb5b0f7ed319573ba176eac31a8f7"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-031601-bd47be2/threedoors-a-darwin-amd64"
    sha256 "bbc236728eaf702439bb88622d9832bbc6fcd2b29ab364dee8502fefc57d0b2f"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-031601-bd47be2/threedoors-a-linux-amd64"
    sha256 "6fbca5f219b8f130f086578eeea092588ce0a72a29ea10eb8666c80d4e99ac93"
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
