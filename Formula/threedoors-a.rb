class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260313.032601.30624fd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-032601-30624fd/threedoors-a-darwin-arm64"
    sha256 "60b959c4cbcfa02ec216edcb1673f03f7ecdc33eaaebeb81b47779e1b5377920"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-032601-30624fd/threedoors-a-darwin-amd64"
    sha256 "efb75a32c6308506e0c18732c51c06b2164dfb2c2982e24f7111ca64bb504962"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260313-032601-30624fd/threedoors-a-linux-amd64"
    sha256 "88abb46bb9b8c847427a88aa398b1500dcb353dca5502367262b158fbaa4eb52"
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
