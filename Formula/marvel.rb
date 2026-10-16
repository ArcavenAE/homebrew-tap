class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.135038.e06f15e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135038-e06f15e/marvel-darwin-arm64"
    sha256 "f3eeeb9f8b238c3f43012f9e1f0a1fcd35d2b834fb8cd42958f92e7ed72d5da0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135038-e06f15e/marvel-darwin-amd64"
    sha256 "309b9e45a32751270b4f6b59abd5a1fd8196c862ee8f130388b8736ec5cb8c40"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135038-e06f15e/marvel-linux-arm64"
    sha256 "08fc8576ee6d1695fd3e23bf03c75e2101b019bcde01139f69db52d7e18f31a4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-135038-e06f15e/marvel-linux-amd64"
    sha256 "e99c066760f155d0917855afbb7165a08bd4d08002d3421ba8ded4574f37df47"
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
