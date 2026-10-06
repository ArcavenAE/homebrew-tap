class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.201913.b9cbe1e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201913-b9cbe1e/marvel-darwin-arm64"
    sha256 "c656ae577634b65d5291974e12c2eda4d22f41980bf224e0ce5a4dff6f378c78"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201913-b9cbe1e/marvel-darwin-amd64"
    sha256 "673aa0984d9f784b66a465a10763d15d439a0dd3090e661f883aee0d3509a627"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201913-b9cbe1e/marvel-linux-arm64"
    sha256 "fe7470084fdedfa5f5405d66d48690e931b6a3befe7c2da814d97de7877da1b2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-201913-b9cbe1e/marvel-linux-amd64"
    sha256 "cb0162c251a2611ab2d0b93bbc4eae8aa1e6ab9f5f5b9e172802f457d59bb3f8"
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
