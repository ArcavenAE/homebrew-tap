class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.6ff670d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6ff670d/threedoors-a-darwin-arm64"
    sha256 "27649641ba95a1540500fa17b561b8c1e9302c73f86cf4a7734b292fbe0c21df"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6ff670d/threedoors-a-darwin-amd64"
    sha256 "01a97e108d669e3ea17a1ce1c7aedab0b06272a13704d68035d716e919e8f1d3"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-6ff670d/threedoors-a-linux-amd64"
    sha256 "c3190fc56d4ededffde543aa8d08b72c19661666175b31b2a797a168e5ecd1f7"
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
