class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.191452.e5f0fa1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-191452-e5f0fa1/marvel-darwin-arm64"
    sha256 "2e5506985ad2c08a8d265806eef81dc62ee25ddc89b955a4f5c6c970b7a8bfe4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-191452-e5f0fa1/marvel-darwin-amd64"
    sha256 "64c6775a2e1a1382ef3bcf3da6365c5fefa85c2a5dd0d6c9d60d2069388aeeeb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-191452-e5f0fa1/marvel-linux-arm64"
    sha256 "cc74df80204c4a3ce855bbdbf4c63a4328bbd9a670bed77732dcae3cd5f23166"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-191452-e5f0fa1/marvel-linux-amd64"
    sha256 "77d2565a639387a0ad299c8a7affdd9a38ca30998fc14138f2e7b7c9f7f09461"
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
