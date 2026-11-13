class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261113.171202.03d0747"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-171202-03d0747/marvel-darwin-arm64"
    sha256 "389a1abb48cdd1f8ffe394a7ca430590944a1b0931d5d954c7b486fc818bb69c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-171202-03d0747/marvel-darwin-amd64"
    sha256 "a6a91c26609065223c5a1b53354619802b16ee18129dcffac2af0608d40a3782"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-171202-03d0747/marvel-linux-arm64"
    sha256 "96e7e24fe03dd38a4f00c95a144abfb88407d4b62f7faf8384d5b8d91389c18c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261113-171202-03d0747/marvel-linux-amd64"
    sha256 "a7bc92fc205126da6245645c665244988687192bb190ff5263bbcf8744ba1478"
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
