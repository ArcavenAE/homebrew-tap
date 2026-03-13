class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.155410.21fbdf9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-155410-21fbdf9/threedoors-a-darwin-arm64"
    sha256 "6de55c033de92a7b26cd2bc14dc2508886fb4cda4886a6cd145edf3ce479fc9c"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-155410-21fbdf9/threedoors-a-darwin-amd64"
    sha256 "9acee3111be019f0ca624098f6f2fd245e689ce8593f6cd175838a5618d49616"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-155410-21fbdf9/threedoors-a-linux-amd64"
    sha256 "8308ec07f5d5730b2bbcbf15441f1713378ea6ec32c226cfa22258dc4fa8c01a"
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
