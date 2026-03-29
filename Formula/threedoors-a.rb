class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.235525.5ce5080"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-235525-5ce5080/threedoors-a-darwin-arm64"
    sha256 "0a71d67c2446873135d097f7d45ff5281de2a6d2cd782b52c74e35a5f580b14e"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-235525-5ce5080/threedoors-a-darwin-amd64"
    sha256 "54ca7bc2323361ccaf5f4c709cbc67a8cf5103e8bd0e61f2bd889f2c07305b76"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-235525-5ce5080/threedoors-a-linux-amd64"
    sha256 "a6f86758877a5832b4ccf755243769be72d67795c223e51e29c7f3121dbcfeef"
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
