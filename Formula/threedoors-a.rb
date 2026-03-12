class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.194745.3599f20"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-194745-3599f20/threedoors-a-darwin-arm64"
    sha256 "f0b8510c6c5bdf10bd5427485d9980993cd0840f579ed282caf07b60fcc2b4de"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-194745-3599f20/threedoors-a-darwin-amd64"
    sha256 "53a11f37ab3cd7315c81304ac701a10c78de895b1541b9494c6a16b7432461fe"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-194745-3599f20/threedoors-a-linux-amd64"
    sha256 "e1b6e08617655d309d0b0157a2e433be02affd429d930a7dff27e24579039fe8"
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
