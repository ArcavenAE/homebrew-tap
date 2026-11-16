class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.221250.cdb86b4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-221250-cdb86b4/marvel-darwin-arm64"
    sha256 "e24c231f1241dbdbe3cba5de22978aaa0e544dcf9582b2e368e35cd7994db8f7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-221250-cdb86b4/marvel-darwin-amd64"
    sha256 "15ae485a7f4c5e7d5a0cd3227a7e81334fb86e864f0d0cf6dfd958785dbce55f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-221250-cdb86b4/marvel-linux-arm64"
    sha256 "a09dbf651d8c9327498ab7199dc67f993ae93d4bdfbb4973c5562e04409a6f26"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-221250-cdb86b4/marvel-linux-amd64"
    sha256 "7c70a5d89bbab6d51fca70554b15dc53e6a5722efa1d804e8be01af5b54b055a"
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
