class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261101.230701.1a519ce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261101-230701-1a519ce/sideshow-darwin-arm64"
    sha256 "3007c2eeacbf8e588ac81a833fa6edf6d38248f95787135212aab8801b1f4a54"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261101-230701-1a519ce/sideshow-darwin-amd64"
    sha256 "3ff1d1925f5258c5d77c15e6e58355d386e9c9a3880a206646c6245047246b95"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261101-230701-1a519ce/sideshow-linux-amd64"
    sha256 "c55968ee25ca08af3c3088ca9215223afc2c67429d38c369b3967f6af677d442"
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
