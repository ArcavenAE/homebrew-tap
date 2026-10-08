class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.050241.d0328fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-050241-d0328fe/sideshow-darwin-arm64"
    sha256 "bee7f3b3e2125b2a5089cee14640dcfe3b3f3135fc1be7d71d5ab62deac7fed9"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-050241-d0328fe/sideshow-darwin-amd64"
    sha256 "cae223fd9deaa09f06d90adcf74c47e207dd04ac1051374d3ecdfa897a59528c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-050241-d0328fe/sideshow-linux-amd64"
    sha256 "9f6086bf3dfa4b117080ee34beed4b1f55d49d767695dbdf7bdee7a9aa0cbb59"
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
