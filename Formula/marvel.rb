class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.032146.289f968"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-032146-289f968/marvel-darwin-arm64"
    sha256 "95818e3e8d07bb9c6b09f55d56d25daf2803ca2fa6e471a8887bc50464d80d01"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-032146-289f968/marvel-darwin-amd64"
    sha256 "a36974ffca6e47d646ebb992cac1bbb376bfb9cf9d0bc2041f79e5d32b73746c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-032146-289f968/marvel-linux-arm64"
    sha256 "bfe6fddba024352bc404673c0e76f9810852c3e463799fd3eb8d1d7b250d652c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-032146-289f968/marvel-linux-amd64"
    sha256 "8b7ef16faa349a166c405e9df663c7a9f7ba39bde21ea803c3681fc1fdc4f769"
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
