class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260319.014547.a9215aa"
  license "MIT"

  if OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-014547-a9215aa/threedoors-a-darwin-arm64"
    sha256 "b598e53463fb4b6738971abbedba62402840343096f9d712606f86378aee6aeb"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260319-014547-a9215aa/threedoors-a-linux-amd64"
    sha256 "919af0ea32e2d5c82bc583aec7e75389745e600059f8960d80b7f21e047670d3"
  end

  def install
    if OS.mac?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
