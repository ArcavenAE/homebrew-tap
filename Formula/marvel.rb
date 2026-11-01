class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.211344.57aaacf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-211344-57aaacf/marvel-darwin-arm64"
    sha256 "effb9939ec3c3363397e70d90f383197b411db9552cce5723382b4633327dbfc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-211344-57aaacf/marvel-darwin-amd64"
    sha256 "f70744c0649d818bea4cf0ae0d65e147e2b1b2351b09808c7d2b46d301536395"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-211344-57aaacf/marvel-linux-arm64"
    sha256 "949d2635388a6cd074b40caffa078386de63938abbd6d51f26669ee3174ce587"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-211344-57aaacf/marvel-linux-amd64"
    sha256 "2a2d4a7660a68ad3746722e9a74cf4786b342cadd19125c7fd9a94a3399786e1"
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
