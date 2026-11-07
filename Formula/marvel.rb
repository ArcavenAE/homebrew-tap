class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261107.011924.c3e1b24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-011924-c3e1b24/marvel-darwin-arm64"
    sha256 "1a40eee20954f76dbd0a2797c646361cd34b5636ba242a273125a08cd7e32ab7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-011924-c3e1b24/marvel-darwin-amd64"
    sha256 "a992ed15e30682814efebefddd624446755e3bcb6d4940efed44cbe3116500a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-011924-c3e1b24/marvel-linux-arm64"
    sha256 "72bcf3e3d8dab38f9cff95a613bda376a5003c05095ca91cd2b1a49eab6afefb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-011924-c3e1b24/marvel-linux-amd64"
    sha256 "bebcb31af5065beffd71f3ac24003216a07a8147c3deaa20b0bbc62973ae813e"
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
