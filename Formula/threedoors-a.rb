class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.15c758f"
  license "MIT"

  on_arm do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-15c758f/threedoors-a-darwin-arm64"
    sha256 "8da194493e4f93db9c38763599a542149a9a84fe3f2d3f97a4b4f580de7d9061"
  end

  on_intel do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-15c758f/threedoors-a-darwin-amd64"
    sha256 "9eae2a3be40a3e5b2ffe0521c6a8b8b67b92cac7d069373e0719807ff2974ebf"
  end

  on_linux do
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-15c758f/threedoors-a-linux-amd64"
    sha256 "0857eb724099fccfae6d633cce860da4772d8cdbf7ac23452e51dcfb342c2aca"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    else
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
