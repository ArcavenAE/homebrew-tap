class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20261107.111105.388ab71"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261107-111105-388ab71/sideshow-darwin-arm64"
    sha256 "f098467f6a3c737c4323d1d8d50fe84ace1861c9aec870d46f7ce56fbf94fd9d"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261107-111105-388ab71/sideshow-darwin-amd64"
    sha256 "ed92a258abdd5d15b74664645c767c45c169a13d931ee2539cc83b268b81d4e4"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20261107-111105-388ab71/sideshow-linux-amd64"
    sha256 "ada0c6e7721e4c934d4568b4b7024b1d0dd9c1dc448890983e5e9347e3674bda"
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
