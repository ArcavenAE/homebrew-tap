class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.065705.6f0567b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065705-6f0567b/marvel-darwin-arm64"
    sha256 "98e8e656efa4100bc3e75b4f3ffbb7f9b59239457b7605918ed99d910d402f6c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065705-6f0567b/marvel-darwin-amd64"
    sha256 "1ce454b550de7ed33791ba662d5c1c9d49c92dd6a617bc07beecc2cb2f4a62bd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065705-6f0567b/marvel-linux-arm64"
    sha256 "ac5f83bcfcc89995d10bdc196ebdda3bdea30d3a931d70114015c46dc14fa0f3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-065705-6f0567b/marvel-linux-amd64"
    sha256 "64bf11bac4ff54b4ab603ecf8f9cd4490026a680ba4e52303bafb64383098522"
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
