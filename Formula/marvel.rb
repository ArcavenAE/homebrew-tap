class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.045840.f933cee"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-045840-f933cee/marvel-darwin-arm64"
    sha256 "a25729c2eb7c4704a9a0ef7056ab163d7a5d2428d43f2eeb7381d9fd022cf24f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-045840-f933cee/marvel-darwin-amd64"
    sha256 "e743bc0ddef23b41a3e8093399986f8b286296c1cce4ca4bf556b052e9269c75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-045840-f933cee/marvel-linux-arm64"
    sha256 "ab6240f0ab1a713c498e6a374e7b7787c985de1d65867930e68b42658383f043"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-045840-f933cee/marvel-linux-amd64"
    sha256 "68e4129ab1c0ab059f270e655927d47e41a2a8390c8b8f7dde255bb33d291cbb"
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
