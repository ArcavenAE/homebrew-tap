class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260312.005546.3903a10"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-005546-3903a10/threedoors-a-darwin-arm64"
    sha256 "14886bf948694ed88d54b0bf8bb1c52239d9d3c15adefd0a0d44ba161149f692"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-005546-3903a10/threedoors-a-darwin-amd64"
    sha256 "5ed0ed629926a4978f36bc0aca03f40d9b48277a94669c84874b62a391b6a735"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260312-005546-3903a10/threedoors-a-linux-amd64"
    sha256 "31bad47da7d6e9ed3e1bfa4333ea96633b599139e4200adc0cb558df09d3e3d4"
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
