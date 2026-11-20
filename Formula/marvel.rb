class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.201203.1d75ba1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-201203-1d75ba1/marvel-darwin-arm64"
    sha256 "84f1bc4714ac311a3640354266412124b227290269abb4608fcfd339bc28088d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-201203-1d75ba1/marvel-darwin-amd64"
    sha256 "a30e2deb3185b3ef606e42b7cf69b465196b170baee00711fae9f612368ea62d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-201203-1d75ba1/marvel-linux-arm64"
    sha256 "21c5352ec912fd1fa1c13734a8fe82bd71ef80f8993cc9847ad567aaaad5c8ba"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-201203-1d75ba1/marvel-linux-amd64"
    sha256 "179b283e9681fd26a98a0d22fe98e00bcc9f7cd633961f3e704baf4851f531b7"
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
