class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.052814.7783752"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-052814-7783752/marvel-darwin-arm64"
    sha256 "5edc14935d997fa6b506ecf83bc510494086331d9e89a91d8c300f1a2feca2e7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-052814-7783752/marvel-darwin-amd64"
    sha256 "bed729675609e4b2e937237991160e17e6346cf44a8f4255e4bea18b240f1dd7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-052814-7783752/marvel-linux-arm64"
    sha256 "c3a17fa83dc52d6ff259a5d061f1df35aab6319d0055415f946733f29e1c16c6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-052814-7783752/marvel-linux-amd64"
    sha256 "ee659bff84c5e573a744cf1347f35c872858289985325a978b97c212c9baa268"
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
