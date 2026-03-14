class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260314.003218.5054a85"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260314-003218-5054a85/threedoors-a-darwin-arm64"
    sha256 "ddf9b00df634fe52166dfa3ac8270c8858f5a56bb77c7fc0122ea5c43a23a183"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260314-003218-5054a85/threedoors-a-darwin-amd64"
    sha256 "cea232e0ccf569121de9eb4a72b2f0461a16f4d6aaf96fd52dd8c6b68fb08a0d"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260314-003218-5054a85/threedoors-a-linux-amd64"
    sha256 "d133ce9a50f8116725b19dcfbbc6ef248514653a700d3c251c94311f209bcee3"
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
