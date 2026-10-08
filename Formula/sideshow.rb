class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.101718.5d9b7a1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-101718-5d9b7a1/sideshow-darwin-arm64"
    sha256 "a9a1763015afe6e1725baa37ac6d480088d921eb9dec77190cb3b2df844a833a"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-101718-5d9b7a1/sideshow-darwin-amd64"
    sha256 "9d41998abdc6a25134c6592e40fe70517a33e86bf5e12dd638bfeb2437303672"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-101718-5d9b7a1/sideshow-linux-amd64"
    sha256 "5654e6bc39722a93413409b0826e5bad30e54b03d77bbef932c27086f1992d93"
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
