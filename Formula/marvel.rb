class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261107.071619.c7c6a80"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-071619-c7c6a80/marvel-darwin-arm64"
    sha256 "21830ebfb632ac8ab55788b407c1422201a6993e5c1e008dc10195fbe4d0689d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-071619-c7c6a80/marvel-darwin-amd64"
    sha256 "d9863749e59f39c730dc153384b92337d8cf490968c185a63d0060049d945c0a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-071619-c7c6a80/marvel-linux-arm64"
    sha256 "70591c53afa16dbe7bbd65754d69a06f0267db2607a22bf1e37a088d12cb0c2b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-071619-c7c6a80/marvel-linux-amd64"
    sha256 "a2e9936255e27ed1fdd61a8f8d43c8a8e9c8b5b05351267d088a5c08bd8f54a0"
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
