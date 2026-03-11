class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.c35de6d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-c35de6d/threedoors-a-darwin-arm64"
    sha256 "3c17b7846f932cd0a667fdaea63e8dc2f9202bd48ebbbe536ee61ad4a49659fb"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-c35de6d/threedoors-a-darwin-amd64"
    sha256 "33b020a152fd37a0e97582ebf04dd7863e94f0c121adce732e154888e8d8b9aa"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-c35de6d/threedoors-a-linux-amd64"
    sha256 "fc2d9e6a72f600d9a62322ac53bfa0e427eb6ca9de26556017c1c46e97eccc54"
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
