class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.001438.18ffcc2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-001438-18ffcc2/threedoors-a-darwin-arm64"
    sha256 "376210cbd595651cfb10c9ef7521e0f80090e5a3a62c36626ab160781e13b82d"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-001438-18ffcc2/threedoors-a-darwin-amd64"
    sha256 "f0728a167ced8d0e48533ddac14c384e3691d4562789dc1400e114ad3b0d4317"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-001438-18ffcc2/threedoors-a-linux-amd64"
    sha256 "5b80027945290ff2cdcce12ab31efedfc0bcf77cc9bf800053335f707ea2017d"
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
