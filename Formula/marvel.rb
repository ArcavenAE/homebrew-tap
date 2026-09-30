class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.162412.efacda9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-162412-efacda9/marvel-darwin-arm64"
    sha256 "e2ba3a6ae3f040ff4bcbdd792164f05cb836274d5b9934e226dc8fa44d320023"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-162412-efacda9/marvel-darwin-amd64"
    sha256 "46c306a7afd4f211a4e044bccf91c7e130fca24d14d19f3dacf86a9558764049"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-162412-efacda9/marvel-linux-arm64"
    sha256 "ebd688a87b4f5e56562ff5c8165827540ebd6a2a80560ac38cc273e46aa6edbc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-162412-efacda9/marvel-linux-amd64"
    sha256 "b3a4977019a9dc06e28648626458a8335aa2021abcfdf6b51d2086f0da4f5af3"
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
