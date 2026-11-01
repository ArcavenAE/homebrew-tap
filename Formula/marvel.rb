class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.163208.33c16bb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-163208-33c16bb/marvel-darwin-arm64"
    sha256 "fddd41e0752effa374d94d1395c0d6815f7ab34f6262678a3af5a59990548ba1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-163208-33c16bb/marvel-darwin-amd64"
    sha256 "0924c9cc5c7d71f20f16d16a3480bee0c3248c9a926ee3a3d4963c02a25ddf25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-163208-33c16bb/marvel-linux-arm64"
    sha256 "546fdc36a016931bbac182f183e1d7b375f39e84a03c06e109c20b79f539c51d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-163208-33c16bb/marvel-linux-amd64"
    sha256 "b03ff52c0a88d433e0ebc4fef33e0f33f64eedc49d10851b7d6e86ae2b7bb4b3"
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
