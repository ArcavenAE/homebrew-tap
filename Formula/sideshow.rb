class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260731.225206.3a96bcb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-225206-3a96bcb/sideshow-darwin-arm64"
    sha256 "6b3b7c4800094dc5356dd23302716b6d15efcf3e2fe2ad173a0ad82df8c06faf"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-225206-3a96bcb/sideshow-darwin-amd64"
    sha256 "7792d6e3dfbf0c139168c28e3f1371cdcd007fe6333d04c9c51c5f430f4769a5"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260731-225206-3a96bcb/sideshow-linux-amd64"
    sha256 "b20fbec1ddec985e0683ec192ccd30785fb4971841b8ea40123fb94d7012b1cd"
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
