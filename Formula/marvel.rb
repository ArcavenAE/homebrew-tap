class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.225452.2bf8752"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-225452-2bf8752/marvel-darwin-arm64"
    sha256 "9d7963cc14d69654305f421eb8f472c1359f55705f296050217c71e2a900fe0d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-225452-2bf8752/marvel-darwin-amd64"
    sha256 "32494e22a9dbacd0c909264bdc683630e7b83b504a2d0412bb9869d79622e7b8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-225452-2bf8752/marvel-linux-arm64"
    sha256 "3cc05773450426481b1190ee67e5267aa9505cba2c2ffba20932ca76d3843fa1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-225452-2bf8752/marvel-linux-amd64"
    sha256 "2faaf16331f822aa196aab4b5600b7109ab046f54bbf1d7318c274ebf2e0436e"
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
