class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.631c54b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-631c54b/threedoors-a-darwin-arm64"
    sha256 "7fc76721eeb22c4dc66b9a27a29d2219eb31264c061ef49f544f0a0fc50077cc"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-631c54b/threedoors-a-darwin-amd64"
    sha256 "6e821ad6b04d1a2f582c7ea461db24615b2bdbaf69d7ef820778d1322fc68726"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-631c54b/threedoors-a-linux-amd64"
    sha256 "a232a110a6df06407e8ad4a5b6ec4657cb7fcd1adbd79f64f548562f807dbf21"
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
