class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.023410.d12b81b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-023410-d12b81b/threedoors-a-darwin-arm64"
    sha256 "6bce2aedfffcf32e3234594e4b40825e4d92bcec0855596605e776e1f683828b"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-023410-d12b81b/threedoors-a-darwin-amd64"
    sha256 "eb1f0dfc5c3ea52259987a8b7cc323ec90478d0e1b08786c2a94aad828261d89"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-023410-d12b81b/threedoors-a-linux-amd64"
    sha256 "bdb48384628ed13c4a0b7ffe59ff778a8c2ab45fc4fe4d9c0a184937fd10e0a8"
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
