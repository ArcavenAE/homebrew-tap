class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.052918.05b819c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052918-05b819c/marvel-darwin-arm64"
    sha256 "06a4068c1e4538213c2e03d382d2522b685b4871bf9d6adc0b24ed30ba42f4f1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052918-05b819c/marvel-darwin-amd64"
    sha256 "9b9fbe6eecf890aa68a4d2a2f6cff79f10109ca79d7af64ff74268a5ea7176c3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052918-05b819c/marvel-linux-arm64"
    sha256 "25af9ef44726b870617f1c68a00b4d2cb9ba5385999cea8ad921026d2053389a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-052918-05b819c/marvel-linux-amd64"
    sha256 "ec76d6887346dad3e19d62179ae1d02e6d59ddb1314db0b49db047d42098a694"
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
