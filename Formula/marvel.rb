class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.044142.06e9452"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-044142-06e9452/marvel-darwin-arm64"
    sha256 "fd6d485749999006bbbfaa597d302177e4516db822a55c98f49ebcd9005b019a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-044142-06e9452/marvel-darwin-amd64"
    sha256 "00f6ea0b3a55cb1392e52bbffe46e6e75e4c7a7b3da5219f01373166b9920619"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-044142-06e9452/marvel-linux-arm64"
    sha256 "34cc81fc06edef4769a4c8a94bb195b6de2b892604241536912e5aee530e23b1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-044142-06e9452/marvel-linux-amd64"
    sha256 "3837f184d25afba9b3506b543e06d35f1a36aae505181badfe154271977b115d"
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
