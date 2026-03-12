class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.195308.8f17b97"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195308-8f17b97/threedoors-a-darwin-arm64"
    sha256 "853290dd9362f41387efd7fd1e12e6aac384be35b56046dd5d3433dede1267ac"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195308-8f17b97/threedoors-a-darwin-amd64"
    sha256 "8c759c794e153af69c5f2d56b0a1a104337433c4c64e6a00df49a3f64f24e62a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-195308-8f17b97/threedoors-a-linux-amd64"
    sha256 "6d9bdee6514f74aa841dba5a62a0449cb4232df3e1733c9f5de00388d811ede3"
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
