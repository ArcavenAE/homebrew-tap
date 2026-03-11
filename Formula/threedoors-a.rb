class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.e2355ad"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e2355ad/threedoors-a-darwin-arm64"
    sha256 "e40ed5906cb120cc3fc5329dba34386c53a075185f73b86f7711c31f8951aaae"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e2355ad/threedoors-a-darwin-amd64"
    sha256 "cf6bcc0b8f41c54732dc0061d0bd8d3c2bfdc42a36cb269bd0757a1bdbd0bca9"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-e2355ad/threedoors-a-linux-amd64"
    sha256 "c212437be5874321d550fadf35f4aa085dddc17bcb61e41a06e71eaeabb78cb7"
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
