class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260319.015013.cc3a2dc"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-015013-cc3a2dc/threedoors-a-darwin-arm64"
    sha256 "63dbff6e2d36acc1f9a5f156d2c476f962b11d3d77a03cdb79f025a2455df7ca"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-015013-cc3a2dc/threedoors-a-linux-amd64"
    sha256 "809af3243b71eb60ad2fe2b6a3707f3991ab7f1e6a25101cc0cff2ae83662fae"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
