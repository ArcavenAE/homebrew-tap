class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260801.014656.9c23690"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-014656-9c23690/sideshow-darwin-arm64"
    sha256 "53c4e6bc695a8ee2786b6f757097e3febe1fa763dc0a95eed87e5671eb0699d6"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-014656-9c23690/sideshow-darwin-amd64"
    sha256 "c12bc8c94a8d2f8981cbaeac90f52edcaf40eb3fe1e8f9d0bd8064d88b4bd4ce"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260801-014656-9c23690/sideshow-linux-amd64"
    sha256 "bb419186d40159846a83e6cee4e79c6cfdb14d43e49ae95f29faeae271f96b98"
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
