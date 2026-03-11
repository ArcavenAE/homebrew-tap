class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.3c6e811"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3c6e811/threedoors-a-darwin-arm64"
    sha256 "f01b38b03f1946f8608dda6ec80723ff29442f871a7f269ef0c657d6dcbfb645"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3c6e811/threedoors-a-darwin-amd64"
    sha256 "07a3dbacacf74e13f1d29980b567af7d1598b757c9b28b94bb4a43afb826be06"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-3c6e811/threedoors-a-linux-amd64"
    sha256 "2a5115929261306e4b67a02b8196ea0b197fc6687ab2d92836fac7a77c300f66"
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
