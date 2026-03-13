class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.150316.1af47bf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-150316-1af47bf/threedoors-a-darwin-arm64"
    sha256 "3f27204b17a205d726d6d1114ef8f53b343f4318d2df8b14eb1c78de09e23b16"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-150316-1af47bf/threedoors-a-darwin-amd64"
    sha256 "5c09a1c18009149949740f8a0ea9852f29b555991686d728a9f03b8c73266f9b"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-150316-1af47bf/threedoors-a-linux-amd64"
    sha256 "a6d3798a0d26ec4888e3787658532eb00d36b9f0d08796996daf4d164be72403"
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
