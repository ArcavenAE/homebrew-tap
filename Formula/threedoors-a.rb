class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260316.043106.f82f5da"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-043106-f82f5da/threedoors-a-darwin-arm64"
    sha256 "3492a18bc474678cbb433753fc4df9a8e5acc7e70b310fd1b2bf9ba66e3ac866"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-043106-f82f5da/threedoors-a-darwin-amd64"
    sha256 "ac6bfadd7fff5588b7eff45fb870e04bd1c9ecad2590442e4371cdd3b0d7c2f4"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260316-043106-f82f5da/threedoors-a-linux-amd64"
    sha256 "d031f80f6eb5e8abd92d863c4376a16d611ec42bde9163b5e8a92070e4c6035f"
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
