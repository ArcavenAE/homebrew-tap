class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.53e13eb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-53e13eb/threedoors-a-darwin-arm64"
    sha256 "06e7b3f74b75185e6f2adc0a92b98d6f9548cbeb1d971f522fd5d96fb34700c6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-53e13eb/threedoors-a-darwin-amd64"
    sha256 "61e3d9f6af7c07ed7b05548e76512ad303fa5de990c0921b5faa60909ca1f1c8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-53e13eb/threedoors-a-linux-amd64"
    sha256 "5366a7c6be06c434718b8112d824489df1a3f0413da738357907afe37f10c6dc"
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
