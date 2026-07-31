class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260731.220419.1c425d7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-220419-1c425d7/marvel-darwin-arm64"
    sha256 "9c5f95b71184f994c300c8713719fbbda5830b6bdd146b56ab260268c94af338"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-220419-1c425d7/marvel-darwin-amd64"
    sha256 "6c7a23940b45c53ab40932cf0b2a47d34c0bad05fafe5e923bbede7541ab9cf0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-220419-1c425d7/marvel-linux-arm64"
    sha256 "7b46310528c284eb3b031c771cdc39b08c51f7aff6f11bdd38af6dba74599a04"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260731-220419-1c425d7/marvel-linux-amd64"
    sha256 "b3cdc5374b9676269c3829496898c9498c97f481ddf63b126bcb77f07d5e652f"
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
