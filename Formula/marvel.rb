class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.141013.75f5f8a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-141013-75f5f8a/marvel-darwin-arm64"
    sha256 "7f37b0bb7244e91326c261aed1b20565340eac626748ce0cafd2041c4c3586d1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-141013-75f5f8a/marvel-darwin-amd64"
    sha256 "d1508847fe5349fc78c0f317e312b5625d419b5566b5e3fb82d8409a00c9e24e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-141013-75f5f8a/marvel-linux-arm64"
    sha256 "edc3a21eb410d69538dff1c3feb244dee48e2499752a6dcf2e8fc75a39b8f3a1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-141013-75f5f8a/marvel-linux-amd64"
    sha256 "cdd2e18d5ec6dbad8ddf681ae1e547a0f1f7298d7d3693be0d9f817fb2a5bb06"
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
