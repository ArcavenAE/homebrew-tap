class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.024009.84a9235"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-024009-84a9235/threedoors-a-darwin-arm64"
    sha256 "fe0c0eb921d5aa72934c72c66b6cd622366a83d98fb68b3fb0fb67828f0f8a25"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-024009-84a9235/threedoors-a-darwin-amd64"
    sha256 "9d0f40409c257b4bea56e474a28ebb853a6f5fe51c7dfe8ce96eae0ad7cf65c1"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-024009-84a9235/threedoors-a-linux-amd64"
    sha256 "59c49c514e23733016f46710d4e06ef2c3f86b518803814d2ef3b862d5dcd428"
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
