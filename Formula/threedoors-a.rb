class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260329.171347.07a7e89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171347-07a7e89/threedoors-a-darwin-arm64"
    sha256 "0d2c03a61b4a6ce04b29f85dadf163319bc88e6ce01796482662f475a23498fa"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171347-07a7e89/threedoors-a-darwin-amd64"
    sha256 "72248637fffb4876a5e03d4f67af146d6c34933944f48127f6a9babe2c1f0421"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260329-171347-07a7e89/threedoors-a-linux-amd64"
    sha256 "0a0269214b3ca04c6d48e99dd4caa3aec0637f71bbf0890c86ee50dc52da5d05"
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
