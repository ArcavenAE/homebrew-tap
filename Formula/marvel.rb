class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.055454.6ce0c48"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-055454-6ce0c48/marvel-darwin-arm64"
    sha256 "c864e076e2122667e580a6efacece285f5b5985ca98f9861734ab0bac3ef65c0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-055454-6ce0c48/marvel-darwin-amd64"
    sha256 "06fa7921cd3cd9505793e7e510899c6d11142084b79090429fdb9865d025d615"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-055454-6ce0c48/marvel-linux-arm64"
    sha256 "534a7c3d4f51bc55a65375884877069a7e48dd7dc2b558ca83e6bcd5f5592c30"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-055454-6ce0c48/marvel-linux-amd64"
    sha256 "9632ae575084c718caf11a94b29a623c62031d1764ea3ce02d5dbb3fff1b56c5"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
