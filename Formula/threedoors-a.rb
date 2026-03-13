class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.200249.65687fa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200249-65687fa/threedoors-a-darwin-arm64"
    sha256 "c6eeb12af3ca70aedcfd9334a93a67b121042b353eea4f0cd9fa27337b55ab75"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200249-65687fa/threedoors-a-darwin-amd64"
    sha256 "1ce25593dcf7687c045e48b4346031d7fabc7014aadfdfa1aa762c0227ac3dc1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-200249-65687fa/threedoors-a-linux-amd64"
    sha256 "639d69a784810a2737dd140c64175b900bc0adcd1c7f50230aed27f3af19b8b9"
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
