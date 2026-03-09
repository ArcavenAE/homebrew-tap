class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.d046ef0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d046ef0/threedoors-a-darwin-arm64"
    sha256 "3a2429d98da714fbd88815e2f1cef0ea0cbdc8a7bf820cf716b62c4436a7d749"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d046ef0/threedoors-a-darwin-amd64"
    sha256 "ed3cc5e78530c5c86ee5f2579704ac91c4018c9d83cc5863c87a69a7c5b38e57"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-d046ef0/threedoors-a-linux-amd64"
    sha256 "8228da5a8469cba2a384069c70f950f08f6cd02f20d44dd9d3f1530d89656eba"
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
