class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260513.202538.271c42f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202538-271c42f/marvel-darwin-arm64"
    sha256 "7d8276dbd3820434bb8e4bf57e2deae5d4b020f77a137d43cf095f7de91eaee4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202538-271c42f/marvel-darwin-amd64"
    sha256 "982f95c69a7ca705cddf89c8ca982e6848cd8bb28b519de34195f248e733a861"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202538-271c42f/marvel-linux-arm64"
    sha256 "be17ee4135aaa1609fe23bad00eaa1f30c0fb788500a8ed75143741e4f9c25af"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-202538-271c42f/marvel-linux-amd64"
    sha256 "2e441e46be5c46ad8914d5b4bb9434ecdc332e181f62ea6d31b5e9a4471eade9"
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
