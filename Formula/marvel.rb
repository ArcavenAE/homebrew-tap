class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.214238.c73259b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-214238-c73259b/marvel-darwin-arm64"
    sha256 "a27ff3b02bbba077119ad4f407b40f7100ba6b1da0379a5804df91f2e3b81fd1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-214238-c73259b/marvel-darwin-amd64"
    sha256 "632bbcd7d6c59eee61f55704b799e5ce0e71505148dc04d79bd32152d8393800"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-214238-c73259b/marvel-linux-arm64"
    sha256 "21f4754912fb7b48c8000494824a5d4f66d5de21e6aa1b2f86828663a76a938c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-214238-c73259b/marvel-linux-amd64"
    sha256 "e67214ff13200944a9768356513b8a833528128811237d7f8b00db22a0292008"
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
