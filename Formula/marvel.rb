class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.063517.e3da496"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063517-e3da496/marvel-darwin-arm64"
    sha256 "79068bb10d56319fbf6f811188e7d0fb30f82cc70cc734292bfe6b2cbe2d16b4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063517-e3da496/marvel-darwin-amd64"
    sha256 "e1815960b30f3746b4c3c0e2b08d4519e61a8093e6700979df3e1536a34e133f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063517-e3da496/marvel-linux-arm64"
    sha256 "16f6be3f9269acd99e57c72eeb99d3315ecf57fb98c2bfeebf569b5a53901819"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-063517-e3da496/marvel-linux-amd64"
    sha256 "3508c87de1bb9fc8fd4dccd549fed3c7656352c4300a3898892035325cf0ff2c"
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
