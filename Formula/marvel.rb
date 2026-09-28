class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.201034.b1f4953"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-201034-b1f4953/marvel-darwin-arm64"
    sha256 "3a765550cccfc323a3c2259b07a2a416183e13b25b7e21d1c389581d77616f39"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-201034-b1f4953/marvel-darwin-amd64"
    sha256 "bacad69109d6bf7e0e02d0b6e836b530a2bfd0b3eb37a694115572e06154012c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-201034-b1f4953/marvel-linux-arm64"
    sha256 "98cc1310913a477f073a49f53a3ae868cbd1fe32824dd3b316ba12ab4f902159"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-201034-b1f4953/marvel-linux-amd64"
    sha256 "28b862c5bd6b827d85954219f79ce4ffa8bb10f4d182c487c68eb633caa9a5d1"
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
