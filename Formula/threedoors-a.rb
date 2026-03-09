class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.2557d60"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2557d60/threedoors-a-darwin-arm64"
    sha256 "127a4eb4d143117319600ab826e8edfe02d8bfb6f56bc2db41f0c9118212cedf"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2557d60/threedoors-a-darwin-amd64"
    sha256 "cb39e53d58c5d948aaac5b56a45a1c2e2fa685e59e07b30dbd57a32853d6779b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2557d60/threedoors-a-linux-amd64"
    sha256 "7e7548cc68397200c4c25c7b27eea3da99c6038e776c92ee46073cad471eec3f"
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
