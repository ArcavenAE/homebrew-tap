class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.2a5dec5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2a5dec5/threedoors-a-darwin-arm64"
    sha256 "521f83e30c89ad71889bea8ef97e74a810905059a2c55c36449c71ff13b3fed1"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2a5dec5/threedoors-a-darwin-amd64"
    sha256 "b244ce8e40cfc44100ce8ed37123df830ceb3e58f7ca740bf998f2d1666c35f1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-2a5dec5/threedoors-a-linux-amd64"
    sha256 "ab9e65dd3b6defd9852a3e4162d3e3fd19fdc9a12f89c97651f05b2c245f782f"
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
