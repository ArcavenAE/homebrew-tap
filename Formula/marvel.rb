class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.220127.0059447"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220127-0059447/marvel-darwin-arm64"
    sha256 "fbfde36bcbecbf4ed559ed1b97837ff2aa8c17a12eb812d20541d0cdda77cdde"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220127-0059447/marvel-darwin-amd64"
    sha256 "30dd8056a6364ab9fdf07e0264c426243c79d21e4f9475eedd5348009eb5b9f6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220127-0059447/marvel-linux-arm64"
    sha256 "638f4c6749b68318413ea8768dc923b25b8a8ee910b22ad9e57217b6b2e9cd98"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-220127-0059447/marvel-linux-amd64"
    sha256 "a92fc081f96b06db07bb4f744f0329f4d90b262301e335383cc35a0eebebacae"
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
