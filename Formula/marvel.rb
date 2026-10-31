class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.235522.21e98f7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-235522-21e98f7/marvel-darwin-arm64"
    sha256 "ba8f79b2491b1a4a779ac56de00b0fca180e8de64ef0739189557a72a1c6e38b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-235522-21e98f7/marvel-darwin-amd64"
    sha256 "a6cd317497a34e37fb2c1d43ea2a7b8860302f0fb5fd5720db9d94222a7b474b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-235522-21e98f7/marvel-linux-arm64"
    sha256 "8ecfee45028895afb3bc4ca625d9da2437b03759bb02d02d06e5c25c62598e62"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-235522-21e98f7/marvel-linux-amd64"
    sha256 "823a3f647952c6bd26e34e4d7e3b3bdac25fbed2ff6a7246bb78a4e14be9c239"
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
