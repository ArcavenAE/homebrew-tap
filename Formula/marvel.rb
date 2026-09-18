class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260918.023529.f071461"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-023529-f071461/marvel-darwin-arm64"
    sha256 "ccdb29416120a4c2cf4d188528dfd1be3dc88fd434df0100bef2e12dabd57b27"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-023529-f071461/marvel-darwin-amd64"
    sha256 "e067c676140d82dfc9926c2bf9c59cafe3f4ec3564a2bdfa3cbcfc5bd9ec11a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-023529-f071461/marvel-linux-arm64"
    sha256 "cf4b8f07665afe3564cc32ac237c166fe724bb8019aaa3c6c37fd438998d6deb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-023529-f071461/marvel-linux-amd64"
    sha256 "a27eb756a6afa23297b85f885dd45ebf88048e6a90d7a89653e82988876fc7c8"
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
