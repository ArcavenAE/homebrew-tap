class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.184705.fb5c42f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184705-fb5c42f/marvel-darwin-arm64"
    sha256 "eeebf95d57c956a8864bdb92208b9e40174a3386261b31f6094fe3cb5a71ac44"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184705-fb5c42f/marvel-darwin-amd64"
    sha256 "953ea54c640af9cdd7f5216f968816e694adfcdf3fe7dc970d24aead64a67f2e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184705-fb5c42f/marvel-linux-arm64"
    sha256 "159c03de29de1eaebdffa8ca21028118197674c943fa01de3b79498c12baa24a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184705-fb5c42f/marvel-linux-amd64"
    sha256 "c4bdba8a4d0fa9dc57a9510531a3753f890f7f43adaca4873ab118de4720bc6d"
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
