class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.212750.3e90582"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-212750-3e90582/threedoors-a-darwin-arm64"
    sha256 "54735a3d0e606b715daee0461eae7fb0eab180f9946a06ee9939104635396109"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-212750-3e90582/threedoors-a-darwin-amd64"
    sha256 "2a30592aa335800272eff8d59bbe6e0bef07eb19e4a19c3f2003a62f43359ae8"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-212750-3e90582/threedoors-a-linux-amd64"
    sha256 "85829ebeb4de39c0107534985cfd019db18e221e15c767c511f505387d1b7760"
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
