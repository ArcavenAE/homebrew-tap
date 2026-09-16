class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every develop push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260916.102642.a911755"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260916-102642-a911755/threedoors-a-darwin-arm64"
    sha256 "249f4594a899afc248b85ad60f06aa5aa60135473626fcddc602ce19313e3b2f"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260916-102642-a911755/threedoors-a-darwin-amd64"
    sha256 "6ad26a8f961accc956a1567087b7150345f9977ae2038d5a051b4e91af18e0ac"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260916-102642-a911755/threedoors-a-linux-amd64"
    sha256 "d6c1d48d02964f4d6a37eff89d04499918792657fec9c5a0a45502f54c13402d"
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
