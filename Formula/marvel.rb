class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.165316.c1364d0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-165316-c1364d0/marvel-darwin-arm64"
    sha256 "9e95e46c6839b99cdfe3a304a9c5aa4060a5067d38f2945c636fe6ae38b447d6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-165316-c1364d0/marvel-darwin-amd64"
    sha256 "cc1fb62e4f4d07109bdbf53edd4f285eeca7d49538d83ecf303fcd4f1f71516e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-165316-c1364d0/marvel-linux-arm64"
    sha256 "b1c2f09a99096c70c14ac156b3fb115a94fc40beab81a37fa534b88b7f73b8c0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-165316-c1364d0/marvel-linux-amd64"
    sha256 "7d59db23e9f85541c2b1534e843d198747744c4ce35c9be0c5fa045bdd7fd59c"
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
