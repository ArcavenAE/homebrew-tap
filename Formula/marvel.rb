class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.214624.f68ee43"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-214624-f68ee43/marvel-darwin-arm64"
    sha256 "04df62fd5318cf6cc7dfcac7cda9a8d0c6d502635de1befd5cde8affaa0c2112"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-214624-f68ee43/marvel-darwin-amd64"
    sha256 "7ec4e4a9c9f69a3d427c9779dbf17b297f32a1259761296b8a305c846137d138"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-214624-f68ee43/marvel-linux-arm64"
    sha256 "77be25d8240c61b3e71d7566767513fbc75ff49992ed17f41b407d9818be8502"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-214624-f68ee43/marvel-linux-amd64"
    sha256 "35d1dd7a1afe3853dfac6fd00323ae9c602d6327cd1501764ed2c5ac36f9b529"
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
