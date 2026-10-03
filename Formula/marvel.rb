class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.130406.4557ba5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-130406-4557ba5/marvel-darwin-arm64"
    sha256 "c239941b95ff2b61d4d572472451b5d55d0ee3bc1b88b682bd76159eaaf57b77"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-130406-4557ba5/marvel-darwin-amd64"
    sha256 "bb248336da99cb2b6f1f875546d1c6cbba27dc2f095f04933666516b21b95041"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-130406-4557ba5/marvel-linux-arm64"
    sha256 "abb600d66d2e99764be58c97033f8a2f42ba54568e393d2e350dba2c297ca64a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-130406-4557ba5/marvel-linux-amd64"
    sha256 "f7c0023be5395092b35419dfb5c61fd752970730f4efecd2001996defde697f8"
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
