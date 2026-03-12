class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.235132.a7290ca"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-235132-a7290ca/threedoors-a-darwin-arm64"
    sha256 "02079bc1d1239ffdd7ed67109c56bd504ebcb60661326a3b31f8eb90521c3652"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-235132-a7290ca/threedoors-a-darwin-amd64"
    sha256 "1e53938f4930fece205eef28f71563166b10de2ea8b7e4454f69d806a73c8cd2"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-235132-a7290ca/threedoors-a-linux-amd64"
    sha256 "47d1e2338cb643a3aa71bc2a7bf23f695c5c737c28b035d2593c397127c3b15f"
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
