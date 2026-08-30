class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.093510.aac8ffa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093510-aac8ffa/marvel-darwin-arm64"
    sha256 "ba22f697cf1b2c65c8458a5f0e00e5bf610d8afec8445a79fab8d87bfc673a1d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093510-aac8ffa/marvel-darwin-amd64"
    sha256 "2c63acf7c44f7e58a07df7a27731d2bdb25355d32129c16e7daf7c7efa67701c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093510-aac8ffa/marvel-linux-arm64"
    sha256 "3cd4059306479a2b060905c0c30474865f184d5b244322b8de3408e9f1c98cc3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-093510-aac8ffa/marvel-linux-amd64"
    sha256 "54cc492311a738163fb9284fe35c38a4190586a37edb2871614930f15b071988"
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
