class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260402.235742.280c16b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-235742-280c16b/threedoors-a-darwin-arm64"
    sha256 "6e1f2605c197b16771c2d9ac60253040709a1fdf25f879303c403d7de1af12db"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-235742-280c16b/threedoors-a-darwin-amd64"
    sha256 "f34ee9543b35c0265893fe0e7cc5cc26ff4e6a5ba33a6f1f042662f722a9c7ad"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260402-235742-280c16b/threedoors-a-linux-amd64"
    sha256 "afa54b140b58e0094ed75c394c697b0e9009a9aceee9fd32be7016808ae30818"
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
