class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcavenae/ThreeDoors"
  version "0.1.0-alpha.20260401.021458.fe1252e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-021458-fe1252e/threedoors-a-darwin-arm64"
    sha256 "bc963004dba16022813f9e825af890fb5f5c77a83da92d921b3d7c8aa143d5b8"
  elsif OS.mac?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-021458-fe1252e/threedoors-a-darwin-amd64"
    sha256 "20ddfb6d7910d7cd7a62213c56372c5f8236b2ad57bf4c784f0444d401065d14"
  elsif OS.linux?
    url "https://github.com/arcavenae/ThreeDoors/releases/download/alpha-20260401-021458-fe1252e/threedoors-a-linux-amd64"
    sha256 "6a3710f50196f821cd0abe041f6528f85598f3b08b037e80de3c26f08befba16"
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
