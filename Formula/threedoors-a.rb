class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.022042.fcd1b1b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022042-fcd1b1b/threedoors-a-darwin-arm64"
    sha256 "b6ac970d56f18dc0490041a98cb68c68e73dde2b30db384d88eb382ccf4463d4"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022042-fcd1b1b/threedoors-a-darwin-amd64"
    sha256 "e040e8fc1587e071006937476810fd38f165025fa2a34599f2c367588a6bb03c"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-022042-fcd1b1b/threedoors-a-linux-amd64"
    sha256 "fa14e50853275588e55e0a17dada65bbdd6694763a376e80f580f8d7126d5764"
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
