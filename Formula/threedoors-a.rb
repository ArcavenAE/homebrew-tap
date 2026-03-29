class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.173023.fdfdd2d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-173023-fdfdd2d/threedoors-a-darwin-arm64"
    sha256 "88455dbc10eda4c78c228a86d0c1dde55dc5cb56126a928e78feae00c9df2ef0"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-173023-fdfdd2d/threedoors-a-darwin-amd64"
    sha256 "c04839afc4f19c2c5425fefd948ea93fbf94e8dc824afa1384bd955145e035bd"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-173023-fdfdd2d/threedoors-a-linux-amd64"
    sha256 "e6ff79f3e98e97bdf01f35eff98b22d1f028dc539f40850b95f93910e29452f8"
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
