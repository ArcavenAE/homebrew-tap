class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.054952.c7502c9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-054952-c7502c9/marvel-darwin-arm64"
    sha256 "42bba726d2f9d30b9c90a45a370549c323f90f3f82715aeed690780c6d27f5d6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-054952-c7502c9/marvel-darwin-amd64"
    sha256 "195a6d4a7287d0ceba5a4a5dae45751f43c6cd1c67faefb62a5dca00bde86eb4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-054952-c7502c9/marvel-linux-arm64"
    sha256 "c174e9ba905d31eb8ecff00b317010fca000cf519dedce4b2d13f8e8211df80d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-054952-c7502c9/marvel-linux-amd64"
    sha256 "096d878f8c2367d36e08042fdfefafe537a9f405d34d15725425d57d0a6b4b19"
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
