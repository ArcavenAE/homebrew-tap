class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.062030.efd2a71"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-062030-efd2a71/marvel-darwin-arm64"
    sha256 "d5139d2047e337e5c454d76df65bcee4167bbbdd02f9752a6f93e2365f3ecb62"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-062030-efd2a71/marvel-darwin-amd64"
    sha256 "abab8ee9fe770bdd0a65e6ef9c86b8adaad4cac8327c5044596927be2f404080"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-062030-efd2a71/marvel-linux-arm64"
    sha256 "f4b6cfbe1a03e034fc026bc0a0ff6451330979a0b8b394d201cf78350b37cf95"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-062030-efd2a71/marvel-linux-amd64"
    sha256 "3e25ca4a85d225dd80282cd3a38fd4b1368900ea774ac1d61deabda34f5d8850"
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
