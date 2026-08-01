class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.024751.f8309db"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-024751-f8309db/marvel-darwin-arm64"
    sha256 "97cf30198cbb6dc221d4fcfb416f2bcffe2c8ad40030eb4ced1b671698d6df67"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-024751-f8309db/marvel-darwin-amd64"
    sha256 "64e3474451f92d50c4188c96ee84b092ceee93816f910d93d0a29c58d593d767"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-024751-f8309db/marvel-linux-arm64"
    sha256 "6b67db6c716f1ceb476dd027233abab32330441aeabd590f37976feb74c18c5d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-024751-f8309db/marvel-linux-amd64"
    sha256 "29cf715bcb298de77a9d41a02cde2bc9a4bfabe1b0e0268ebadb764faedcfd93"
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
