class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260713.012118.267158d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-012118-267158d/sideshow-darwin-arm64"
    sha256 "7429874727e3903b6468e3cbabb3ed585c84cd6d863ded9b139cfe1b957b2b5f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-012118-267158d/sideshow-darwin-amd64"
    sha256 "85ad8ad044466cf4dda70c057da2ab51287cb8a1e5e47507ae490b9e3d0e59f7"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260713-012118-267158d/sideshow-linux-amd64"
    sha256 "e2bad4d8fbd4316304f56e51380c0523f2266ce23eabd0ea82d212d80af0ffc1"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
