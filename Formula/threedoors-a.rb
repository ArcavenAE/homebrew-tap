class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.040811.c12506b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-040811-c12506b/threedoors-a-darwin-arm64"
    sha256 "15e113914fc05e7dc7f90cd1f90a197db923d5e685347c962eb939e811fa54a8"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-040811-c12506b/threedoors-a-darwin-amd64"
    sha256 "a9943c80a15e887a04c1139ac8b1496e2c2cf51a69275e48300cdde8985fc644"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-040811-c12506b/threedoors-a-linux-amd64"
    sha256 "88fdeda29e280ba93223bb76873caa775d2c56390e9a816a665013d9122c40aa"
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
