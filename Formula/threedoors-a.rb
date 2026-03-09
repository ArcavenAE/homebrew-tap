class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.dd2b78b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-dd2b78b/threedoors-a-darwin-arm64"
    sha256 "7b83c372505210fe40129a7348eef926728f3680b6881ce6499ec70c5dc8e432"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-dd2b78b/threedoors-a-darwin-amd64"
    sha256 "63a920e10d5418df1673214d6bb8af9588e83384aeb8953513c0f34c1dbc46c1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-dd2b78b/threedoors-a-linux-amd64"
    sha256 "7878f689c1e0a4bc0368661c279fb1322be9c20757f2732f16d1004ea37e63b7"
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
