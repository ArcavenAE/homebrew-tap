class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260402.230710.f4d03b8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-230710-f4d03b8/threedoors-a-darwin-arm64"
    sha256 "551cb9375755f8587a4cfa71e9328c1b69d1d1e2fc79da9a3553ed7768f35b04"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-230710-f4d03b8/threedoors-a-darwin-amd64"
    sha256 "c660bf4b0dfb9689aa9f402cdf6c4f968f1e1aa6241d1234828d8ae259cbd94f"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-230710-f4d03b8/threedoors-a-linux-amd64"
    sha256 "99970790fb707ae107a0c1239da70ac9916197ede6b4a99a054600f6f3b533c1"
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
