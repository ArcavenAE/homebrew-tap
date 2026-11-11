class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261111.155253.a05a475"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-155253-a05a475/marvel-darwin-arm64"
    sha256 "c8e890dc0e046ad78c99caac98f4780810d64f5dd0ff95c513e64992f862ef15"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-155253-a05a475/marvel-darwin-amd64"
    sha256 "7ed8886ab79022e42ff7d40e4b1e13751518425ac1e59bb15d5083f4a704f293"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-155253-a05a475/marvel-linux-arm64"
    sha256 "bf101956f681898a6642c9ff12b5f68626d7106d63fcc0da8ea2c9f2b83fd951"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-155253-a05a475/marvel-linux-amd64"
    sha256 "40f103296d33dec3a8fbbb8e48ff56e5c9084a488191b6d51da0513c394e33db"
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
