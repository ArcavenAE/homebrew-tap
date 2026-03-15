class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260315.174128.b6e1ab0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-174128-b6e1ab0/threedoors-a-darwin-arm64"
    sha256 "8ddcc2da4daf1f256a6d887ec804daf1eb415c937ab15b996114ccf86dd41a0f"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-174128-b6e1ab0/threedoors-a-darwin-amd64"
    sha256 "6c6876120a020ca7a715e96c8513b9bfdb4e2c78e510326f641f1ba81176f802"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260315-174128-b6e1ab0/threedoors-a-linux-amd64"
    sha256 "6d4ef315e3eb6de8bd501c9c0df5d497d49286a9db1a2291174ae780e41f8fd4"
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
