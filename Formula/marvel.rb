class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.001540.c42c1d1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-001540-c42c1d1/marvel-darwin-arm64"
    sha256 "ad71676fbb20314690fb3e520c813a5734346738b1bd11f08437feb069adae68"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-001540-c42c1d1/marvel-darwin-amd64"
    sha256 "fac4fd38124fef474706b2100fa9ccfd06bee77429ecaddeda5751edd38d471e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-001540-c42c1d1/marvel-linux-arm64"
    sha256 "69ceda6ac06c74320877fd50fea129ecbcd1fbc86aa86ae97d01b52d53d0bfb5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-001540-c42c1d1/marvel-linux-amd64"
    sha256 "9cb4c0e5b0617c22ed295aeaaf9cd36c22b6fc08d5b57c8757afeeb2548b6644"
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
