class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.063146.ddf75a4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-063146-ddf75a4/threedoors-a-darwin-arm64"
    sha256 "9b68252947a489f03787670a6983fabeca74496a9327bf9c17dca83c9ebcc4bb"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-063146-ddf75a4/threedoors-a-darwin-amd64"
    sha256 "48cb749a442f28e785e78f54357060d733a998b6d151d485938d6a647c0e93b1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-063146-ddf75a4/threedoors-a-linux-amd64"
    sha256 "7bf3cd3d4cb879de0f7d664f1d889a85f34d77dee5d42c745dd065403d27a12f"
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
