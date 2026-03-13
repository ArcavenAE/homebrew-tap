class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.222223.76c4da9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222223-76c4da9/threedoors-a-darwin-arm64"
    sha256 "bae6af03f0ef22f10bda6ea970c17e638bc8da788325b375303f090b553aae56"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222223-76c4da9/threedoors-a-darwin-amd64"
    sha256 "cdbca63a3fbb84e4e5dd779c3440f448c13b8f4afbfffb065ebaf788596474f8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-222223-76c4da9/threedoors-a-linux-amd64"
    sha256 "b4ef04f4505b88c0129a2f37f7b197e027576f2de5dd3ab2c0425f6c366675c3"
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
