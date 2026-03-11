class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.5d76ac7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-5d76ac7/threedoors-a-darwin-arm64"
    sha256 "569d2e5e7fd90d3f2eb5ff3fdd1145e8ba9e8cbb04bd1ddcf6fb375b5429ab79"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-5d76ac7/threedoors-a-darwin-amd64"
    sha256 "9adacd0205be13309a3ff28e25af0077ab2558162f177a683467f8c2a93b0044"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-5d76ac7/threedoors-a-linux-amd64"
    sha256 "69b1b14c4b51a146866fb6a980a089bebe6f0033dd134322625ba34686101dfa"
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
