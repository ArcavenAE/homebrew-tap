class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.f9f03b9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-f9f03b9/threedoors-a-darwin-arm64"
    sha256 "0449bbdf1d2f42fabe17cb22d2c8ac782c04a3e164d77907f7d3c06d25b63afd"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-f9f03b9/threedoors-a-darwin-amd64"
    sha256 "16f4a8c9229448a95e0cdfe2eae4bab550c93f550078e1ee61fe07b50f3f414e"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-f9f03b9/threedoors-a-linux-amd64"
    sha256 "021b56a022db05eac59d65f1259a455289e569cc0859a573fdf7f08ef46b7a31"
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
