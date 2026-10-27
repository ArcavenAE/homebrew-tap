class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.144609.4718f2b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-144609-4718f2b/marvel-darwin-arm64"
    sha256 "36eaada80f25b307407041ff065f27f0ceff260d0bc67640458a08207f891754"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-144609-4718f2b/marvel-darwin-amd64"
    sha256 "08b315ba74da5d6ee76089cc03bf021dcaa212076abd62f6c796711cc8f26d49"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-144609-4718f2b/marvel-linux-arm64"
    sha256 "b8f3f73b31886ba04c7ac5852e4fa25d6de87c24943d7335c6c53f97f7aeb758"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-144609-4718f2b/marvel-linux-amd64"
    sha256 "1ee2b42c7c0cbe34d6e6d16431f6d407cb9437bdb793beb76956feee33c8de7c"
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
