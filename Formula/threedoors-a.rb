class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260405.061313.c106006"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-061313-c106006/threedoors-a-darwin-arm64"
    sha256 "100e2eb4a6b5a84fc55b676672d89851f5d2b8c623d047503d7e17724a7280dc"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-061313-c106006/threedoors-a-darwin-amd64"
    sha256 "233dc84290b24b9c04c6105f5303714ac850cb2aba66b915e597fd608efd0216"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260405-061313-c106006/threedoors-a-linux-amd64"
    sha256 "33a05eb0e8135a90cd37556ae5931579f29924c3a905ba54ec8c1255a27a491b"
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
