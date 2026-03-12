class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.030709.8b1b2ca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-030709-8b1b2ca/threedoors-a-darwin-arm64"
    sha256 "35a3521fac2b65175bc14369e2a83b2443c43bd2f104ca5d35098e69065a4cbd"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-030709-8b1b2ca/threedoors-a-darwin-amd64"
    sha256 "c2870a43c90ac3d639cbfa682342337ca2ac68e589453a3a325ada2ec8f33ac0"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-030709-8b1b2ca/threedoors-a-linux-amd64"
    sha256 "ea115be0c1944dd070cddeb61f3b9fea9dbfc32ec9c986eb0ed09376248a613a"
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
