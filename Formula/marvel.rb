class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.190657.108b323"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190657-108b323/marvel-darwin-arm64"
    sha256 "657ad712a3e46730c72df64331dcc8cffb7331d8e8255a115315a1eac29c9711"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190657-108b323/marvel-darwin-amd64"
    sha256 "cf1023fc61fdde8c8496e7c5df9e5d172c9178a96bf1bca6fe67bf94f7aabef2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190657-108b323/marvel-linux-arm64"
    sha256 "b9cde2cfe364d5a6ee87e599a53e454ac4dd5d7d671ca83899894a77a08ec7a3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-190657-108b323/marvel-linux-amd64"
    sha256 "4db5c3516564aed7c026f24683c7c3b35126048ffef037c7b24dadc0ee34408e"
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
