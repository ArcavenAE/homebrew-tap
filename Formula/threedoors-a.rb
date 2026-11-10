class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20261109.235418.a8a5169"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-235418-a8a5169/threedoors-a-darwin-arm64"
    sha256 "586b768f383893438494618d95ffefb79e0c33460a1940b2ba14ca216b00b4d8"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-235418-a8a5169/threedoors-a-darwin-amd64"
    sha256 "d22b2e8c918254c89f34cda9936c70da0e4223967ef783b223d8630e93a83f0c"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20261109-235418-a8a5169/threedoors-a-linux-amd64"
    sha256 "f4ce47360c15da7175f3472d5d1d86ba6acc5e687a47ac4a576dd41ca8375439"
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
