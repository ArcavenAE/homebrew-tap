class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261007.070238.7faddc0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-070238-7faddc0/sideshow-darwin-arm64"
    sha256 "829c7a85d16eac54eabdc3f5f9bbeb2c4784eacb910c991e8aad52756c4b7a09"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-070238-7faddc0/sideshow-darwin-amd64"
    sha256 "f918e49cfd638b0334974a92fd7faadc24a4c6955253c40234bc427a988efe1d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261007-070238-7faddc0/sideshow-linux-amd64"
    sha256 "740b2ec0a5699b766a6bf5cd6e436cf03e2d69907b3f6fdb44a3241a52b6d656"
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
