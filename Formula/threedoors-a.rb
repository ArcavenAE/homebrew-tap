class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.223956.42098d6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-223956-42098d6/threedoors-a-darwin-arm64"
    sha256 "dc8db47770b4bf81882195feb93ca21ed7e2f489f99c563e39d5eea7e560460b"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-223956-42098d6/threedoors-a-darwin-amd64"
    sha256 "a9a4ff057051060e63a33834d8e338bd5c07fd7f44b0d4db000ce8258cc55ced"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-223956-42098d6/threedoors-a-linux-amd64"
    sha256 "32c2040f0cb8dbccb7387c13de1557997592291e9a8f87bd9bd84637ac0bae99"
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
