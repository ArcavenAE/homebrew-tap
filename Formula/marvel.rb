class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.052034.7556d5a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052034-7556d5a/marvel-darwin-arm64"
    sha256 "2b62f5acd2bb164d8fc61a244b7c8318824f24187b2a3513c4d87282c741c775"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052034-7556d5a/marvel-darwin-amd64"
    sha256 "ebf4649300d0b0a9807369fbbe487ad728ee11da1b3ab1daf5fc60b88b7adac5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052034-7556d5a/marvel-linux-arm64"
    sha256 "0c02cd223591d10a1020488348b36cb66280e696cc8e099d4003ad2ad618fece"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-052034-7556d5a/marvel-linux-amd64"
    sha256 "9ac7c1ecdcf5247ed36a24ec24500db4a3b7d87a174334f9e3b771b22c5d8877"
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
