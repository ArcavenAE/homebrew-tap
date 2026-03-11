class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.869ad02"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-869ad02/threedoors-a-darwin-arm64"
    sha256 "0da32d17c868a7703280a6db3c2343d45d27db0ec95eba05a4d270f0ffdd4519"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-869ad02/threedoors-a-darwin-amd64"
    sha256 "5b9726ad0276e5b3a3aa6cfa2b397257757f45201e4d694d30f327c4a1e8daf5"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-869ad02/threedoors-a-linux-amd64"
    sha256 "041e12f62802b32fd37b87021860cd9f3da72c6762ce785a69c4c5e591c3d316"
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
