class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.222852.6c59cff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-222852-6c59cff/threedoors-a-darwin-arm64"
    sha256 "66a8a90f3db74c1eb41f54dfb930148faac3ae050aaf25b36810ef40b387772b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-222852-6c59cff/threedoors-a-darwin-amd64"
    sha256 "98323a170f5e0b255fef1b9f14942dae0af0de6cfb6f9a3600fc7fe7161d38d2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-222852-6c59cff/threedoors-a-linux-amd64"
    sha256 "c146bca2c3b188b1b90faff1d6411520812f085e5ce4a0dd74237a5e78be0d51"
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
