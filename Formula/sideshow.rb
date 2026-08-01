class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.200326.54736a8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-200326-54736a8/sideshow-darwin-arm64"
    sha256 "de813b6dc594e2c8711189e4b72c3998376f05d76d7f3d25474175b05dcbba42"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-200326-54736a8/sideshow-darwin-amd64"
    sha256 "7db5564356871d41529c44ba6477dbf17d4720bfa0ed454a452a559fbf06db1d"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-200326-54736a8/sideshow-linux-amd64"
    sha256 "f91424f5aa9e9034510a37c839fdf8f726b85c559a7219ac7187f031730ad4ed"
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
