class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.215008.70c0c5b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-215008-70c0c5b/marvel-darwin-arm64"
    sha256 "a5ef979883a385306486f3bc2d06fd1c6810a9b831211249578ad971904ad02a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-215008-70c0c5b/marvel-darwin-amd64"
    sha256 "8e4e2a4d396aa535a79d12bc0890e91902f3d2bc5632ec80fa40070491432f6e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-215008-70c0c5b/marvel-linux-arm64"
    sha256 "52d5027d2e258d576001ef570bc4b27435ca22bc1be091df7c610a3982d6e510"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-215008-70c0c5b/marvel-linux-amd64"
    sha256 "10142167bce124ff2ad2317e0ca7dda126a21b645830413038f878590a693c50"
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
