class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.162842.5b194e1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-162842-5b194e1/marvel-darwin-arm64"
    sha256 "b96637d72d71930bf78c1a8e6d0872596723772f88fbfbd455dca293f3b0a409"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-162842-5b194e1/marvel-darwin-amd64"
    sha256 "9a179facb6d0cb29be56e1f75e3ab30088ee4d0bc0d7a0710912282d1968b0f1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-162842-5b194e1/marvel-linux-arm64"
    sha256 "35bc5ac553009babb4b5c460858c25ecb8a9a6b1e04bc5908165d16683471f0c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-162842-5b194e1/marvel-linux-amd64"
    sha256 "942208704fb52a7d357953f7a7b5cb0d4a082ee46b977a4a75f23a0f38c98b78"
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
