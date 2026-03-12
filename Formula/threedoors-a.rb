class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.183915.6200772"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-183915-6200772/threedoors-a-darwin-arm64"
    sha256 "90592644b8dc2ccb87ced1c54ada26d360df64782384e9febd6544613b0986e6"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-183915-6200772/threedoors-a-darwin-amd64"
    sha256 "c3e639db53e4025e4a57f2f048fff9f2f4f9e503e34fbaa143bcffd5e913191a"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-183915-6200772/threedoors-a-linux-amd64"
    sha256 "0f6ebec105dc6092b1e86c4804f261545236abf4e8327d1accd8348d34c842db"
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
