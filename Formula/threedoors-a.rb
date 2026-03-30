class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260330.060622.b48ffa5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-060622-b48ffa5/threedoors-a-darwin-arm64"
    sha256 "a9ab2c3d493fc7990c6dd37356f402d499ccd220a474f4518b9d454744e04605"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-060622-b48ffa5/threedoors-a-darwin-amd64"
    sha256 "16d44c4a5e861f984379ff85c54f737abb196ec28e73dd6ce807b91356784ea3"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260330-060622-b48ffa5/threedoors-a-linux-amd64"
    sha256 "344ea27c743b01f860017e8a9bb5b09601dfd862fe68b95d15a6a5df8cb476f4"
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
