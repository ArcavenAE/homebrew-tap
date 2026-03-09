class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.1c8185d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-1c8185d/threedoors-a-darwin-arm64"
    sha256 "759a29fc1cfcb07007b6a88c2cc44d597a30717746bc7d20eee88ae37b4c6702"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-1c8185d/threedoors-a-darwin-amd64"
    sha256 "b7c48bcad5df43585521860f79e1c21110ed773b23368ca04e7dc8f49c781f83"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-1c8185d/threedoors-a-linux-amd64"
    sha256 "4c971d9c80bc310d5aa88aeff4b1be266018fddd32347913d7437a1cdd2e1a95"
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
