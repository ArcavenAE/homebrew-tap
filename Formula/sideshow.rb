class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261006.235101.c2a16e3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261006-235101-c2a16e3/sideshow-darwin-arm64"
    sha256 "67d79d5668d75b2cef808de585b5bc4dc613d9f52ab9e4d2978b8e0d1d171088"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261006-235101-c2a16e3/sideshow-darwin-amd64"
    sha256 "b166381c57db4bc2881fe474f16b87b79f622227bc52e9a90c5edef0d4adc741"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261006-235101-c2a16e3/sideshow-linux-amd64"
    sha256 "58136e0d3678c6edf57acc869aab70c1e7d69e5ed6c4e288015d66828873ac13"
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
