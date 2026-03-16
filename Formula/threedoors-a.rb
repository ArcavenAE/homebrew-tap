class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.023803.c45ba07"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-023803-c45ba07/threedoors-a-darwin-arm64"
    sha256 "b5fde0c9b29646d22bcbdaab6d54c01adf2a9e0554241b98de35eea1892b6545"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-023803-c45ba07/threedoors-a-darwin-amd64"
    sha256 "6997ff36f06b8cd8c8804d2c21d73e7bb8159934304330087d58eaad8f38f2de"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-023803-c45ba07/threedoors-a-linux-amd64"
    sha256 "f276e9aeffaaeb9ec95892f5a5cca783efe6ee06963ef05b00444f26d3b9ca9e"
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
