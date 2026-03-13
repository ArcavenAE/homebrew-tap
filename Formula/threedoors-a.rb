class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.205933.9e1d251"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205933-9e1d251/threedoors-a-darwin-arm64"
    sha256 "b41610b7c488a741a13fdbeaff8effd674277eb453bc10459fb013863998f7a9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205933-9e1d251/threedoors-a-darwin-amd64"
    sha256 "4be88e4f8766b7fb965e84b534878397faaadd5f0d4d00a3ea4b83161ad07be3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-205933-9e1d251/threedoors-a-linux-amd64"
    sha256 "c4cb7292014111fc9f508e6586dc5aba3966ee06a94ebd14f164d209b8d65d72"
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
