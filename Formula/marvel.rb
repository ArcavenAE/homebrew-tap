class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261019.191534.69461c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-191534-69461c4/marvel-darwin-arm64"
    sha256 "4f615e477d07e40f0af1a36dc604b75f46ca563a81ef72e4aa5d606afa865ff2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-191534-69461c4/marvel-darwin-amd64"
    sha256 "67806cadacf75cca4244ebdcde549291d38f1f7b17394ce0484ee8c57683abf8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-191534-69461c4/marvel-linux-arm64"
    sha256 "cb4b15ceffc6db7e2aa7049928d812e62b0552373191d9393d9efc349bbc4e81"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261019-191534-69461c4/marvel-linux-amd64"
    sha256 "2d5b619706b7961515a65dafd4ee3a9ace91627a097bae14714af02960b204d2"
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
