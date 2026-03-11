class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.230734.7f8fb12"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-230734-7f8fb12/threedoors-a-darwin-arm64"
    sha256 "caa9c6542a334e32086356e58b4e8fd7d193692047a404c82b04fd34a8bb4649"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-230734-7f8fb12/threedoors-a-darwin-amd64"
    sha256 "3ac490b194e97c145886c9efe1fadbc142b372dc7cb3a00f9873a0958af8a9cb"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-230734-7f8fb12/threedoors-a-linux-amd64"
    sha256 "dc40438ecd421405d695949578cd87e6c1c31b12b0236c90363dfed15d01cd5d"
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
