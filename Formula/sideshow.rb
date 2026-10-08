class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261008.063233.0ed75d0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-063233-0ed75d0/sideshow-darwin-arm64"
    sha256 "862cbfa64fd9cb084d2ffa63aa4928517a74d6fa1dad424a289243dc85a2905f"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-063233-0ed75d0/sideshow-darwin-amd64"
    sha256 "de59d3464cb04eb07b74f57a9fd28cf5d99602303d87d9d33bfffb38b63ac6ba"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261008-063233-0ed75d0/sideshow-linux-amd64"
    sha256 "4fd45db04f51c76d161cb8fe3c2e96fc8a76a968ae3e39a84d6bca9e43911aec"
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
