class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.230951.51c1277"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-230951-51c1277/threedoors-a-darwin-arm64"
    sha256 "4a145065ea5d2332bc0eed428bbef114d7add03350396ff5e278691b95787fa9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-230951-51c1277/threedoors-a-darwin-amd64"
    sha256 "ee4abc120760042a91e97f2d84352623d23af932f411c61951ac3bf2421b8a43"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-230951-51c1277/threedoors-a-linux-amd64"
    sha256 "dbbd5f231ea12f9c22717a304bf36b2513df73d0d2983b2abeb76619d1a7861f"
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
