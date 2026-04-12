class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260412.024603.bd9bf88"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-024603-bd9bf88/sideshow-darwin-arm64"
    sha256 "edaffcefebdae3783877a61a51a2220dbc0d4d1cfd5abf570bd4920edd775e54"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-024603-bd9bf88/sideshow-darwin-amd64"
    sha256 "81f11d66442b08d65c6fb4c1303a50729811c1dcb12a95f2fb9e0550d2f2116c"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260412-024603-bd9bf88/sideshow-linux-amd64"
    sha256 "c5515187fd2b3a77c7a9beaf20ec7e780167c2a46a6d6f0077ce1020f4f32ed1"
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
