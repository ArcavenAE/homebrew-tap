class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.235823.f067a75"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-235823-f067a75/marvel-darwin-arm64"
    sha256 "63a210ee54f79b27162123e423b247243e3799f5171db016f7658d5f0af14541"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-235823-f067a75/marvel-darwin-amd64"
    sha256 "94c86b115cd467d51de6c600368d0bdf311599066f5b8ecf720d571c0807b9fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-235823-f067a75/marvel-linux-arm64"
    sha256 "3d5bfd60876de01ab940cf7595a2c90f3f35a23b5fdcd4dbae7c5e17169af778"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-235823-f067a75/marvel-linux-amd64"
    sha256 "a29ecb9972fd2ffa06f902029a4cace1b93a69d747d602ef25eec9860e3c66bf"
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
