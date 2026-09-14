class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.222258.6a0da2d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222258-6a0da2d/marvel-darwin-arm64"
    sha256 "905fd2bc4ea596a671638ba52f6577e182174b0e5e174179bc6ccf2838be0059"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222258-6a0da2d/marvel-darwin-amd64"
    sha256 "3be1f26f50e30f5c4678677dd7e20cc458bf7bb17e0b6df718f0ceca2ddc5534"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222258-6a0da2d/marvel-linux-arm64"
    sha256 "e48fdefdb585a54840f1f2b1345b691be933099d1bc56c880d9f0bf2a3e55987"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222258-6a0da2d/marvel-linux-amd64"
    sha256 "93eb0186482aa951d71062ac843a9408ad8b809bc17629a02d8256031c1a15a6"
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
