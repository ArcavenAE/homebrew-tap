class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.175038.ff5d5f9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-175038-ff5d5f9/marvel-darwin-arm64"
    sha256 "74efeb1334ab9baa62578dd4a398596f24002f4e0dc00ce3e72865f479e83449"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-175038-ff5d5f9/marvel-darwin-amd64"
    sha256 "6b87c068961a250369a46d7c6857cc4959237a1edca2cfbc1b3cf0c1104cf662"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-175038-ff5d5f9/marvel-linux-arm64"
    sha256 "29719e8680f60ad21e7ecdbc3be8ac9442819791da630343a7d494da95622b3f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-175038-ff5d5f9/marvel-linux-amd64"
    sha256 "917eeb2255fe715cb535088b71abf623ec22f0d3ee11d15b2db891c00a00c980"
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
