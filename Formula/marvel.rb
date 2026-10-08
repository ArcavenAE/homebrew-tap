class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.122001.e5b6a23"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122001-e5b6a23/marvel-darwin-arm64"
    sha256 "6a6f80eb65c55a686dc723ffb94467eaecc47547790c2a55f06ea4afbe8813a3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122001-e5b6a23/marvel-darwin-amd64"
    sha256 "94b8049668c394b9967c6a2eb0a58aa284cb22d234d9178c024b6e173bf8a9b8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122001-e5b6a23/marvel-linux-arm64"
    sha256 "a1d3bfca80c1bd99e139cc57e33ee9b826566bebdc534236adaf5df7a27cfbe1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-122001-e5b6a23/marvel-linux-amd64"
    sha256 "93327ed3f43af89a8e5bd992f34ecbe6098e33fc662de78a5d749b523a5b5649"
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
