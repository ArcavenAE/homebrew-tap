class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260805.225208.1531cbe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225208-1531cbe/marvel-darwin-arm64"
    sha256 "5103780bbf20351a464d435281e3217934588752cdcb99d338a40a1844f4111e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225208-1531cbe/marvel-darwin-amd64"
    sha256 "e734e2798fabeaa10ba4341710cdbd65abb2eba9bb7ba8327bd8da30c02a0d6b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225208-1531cbe/marvel-linux-arm64"
    sha256 "acaaab18583cd84193dced6365b5d7619e29a9d451c6d83273cc7f7edb5139dc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260805-225208-1531cbe/marvel-linux-amd64"
    sha256 "e42824378f4f51acbd0cbe2cd9ee9409a72cc753358a40bfe66c2fff2bdae78a"
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
