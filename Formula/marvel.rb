class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.060240.3cb6101"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-060240-3cb6101/marvel-darwin-arm64"
    sha256 "d4cf0b9d1b366e8cd6181055d286a831627e037bf9f903ca8cb1e8c71b2e5ea9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-060240-3cb6101/marvel-darwin-amd64"
    sha256 "108dd9945b2509d182c2d4012ddc7bcff4cf6df0ce9ab70a934ed917cb86a8bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-060240-3cb6101/marvel-linux-arm64"
    sha256 "16761fc726f6d2079097565a91b1095fc6c1f231360a4929e5337986a2abad9e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-060240-3cb6101/marvel-linux-amd64"
    sha256 "8f597a64562502f15dd9fabc0f7eb2a6bbd2227767c9311a4251ad483ae11a6c"
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
