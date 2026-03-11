class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.921c05f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-921c05f/threedoors-a-darwin-arm64"
    sha256 "f154e7b0c456507cad0ef639081554769ec6a0bb534a48d57edf0a451ef1a5c9"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-921c05f/threedoors-a-darwin-amd64"
    sha256 "cabb5d30493a53caa9a7d031230a4a61c22549a73d60dc6a4de9c86631a42520"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-921c05f/threedoors-a-linux-amd64"
    sha256 "30c5d800c5475e0cdcb8751cc5ebf5d5acffeeb564f96191d0f509b4ce33a5ad"
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
