class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.004610.6992204"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-004610-6992204/marvel-darwin-arm64"
    sha256 "9121ba74fceb70c77b7ac996f71b578d3abae8ebd273440531d2ac3fd1deda70"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-004610-6992204/marvel-darwin-amd64"
    sha256 "c0610ce187556dd01c05697078be2e229ee805fb2434745a4e73d47c76d04374"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-004610-6992204/marvel-linux-arm64"
    sha256 "d4cbac2ff81df806eed4388914e7e54e424e8fed6ee24b1612988c807a4034f7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-004610-6992204/marvel-linux-amd64"
    sha256 "265e91d93d07b2cb1f4df98b571cfeffbb299667505b48484ed93038ec28c74f"
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
