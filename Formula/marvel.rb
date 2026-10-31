class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.002745.7ac9701"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002745-7ac9701/marvel-darwin-arm64"
    sha256 "1a86219f02a38c7258afa4f3ce0a385344902763210a6a51090f352a7ec75cd5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002745-7ac9701/marvel-darwin-amd64"
    sha256 "4b0466e47d2ecfe7ced965c216204a47e2aee416aeddb3aa742276565c860a60"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002745-7ac9701/marvel-linux-arm64"
    sha256 "0285a03742b396a7736cf0f1eeeca6717acdb577dddba830fd12e7f4949592a6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-002745-7ac9701/marvel-linux-amd64"
    sha256 "50b42cefaebceda00af29c49fec72ee855224f8ded7300c1f3a2554e0c49ab0a"
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
