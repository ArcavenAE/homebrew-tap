class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.124016.372c840"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-124016-372c840/marvel-darwin-arm64"
    sha256 "de4b294ea7182ddf9962f6275c28ad83f1fd1b29c3f80cf3c3ff38c4e98d69f9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-124016-372c840/marvel-darwin-amd64"
    sha256 "12afd5a886b64822c55085f45ef3aa99206be4ebae890c66d45444ad579c578a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-124016-372c840/marvel-linux-arm64"
    sha256 "7d8ec2fea8431e5431053eddb33f51c067d0524b9d6e95f46560f86276d86562"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-124016-372c840/marvel-linux-amd64"
    sha256 "8eeb8e642d2e62f351c0459722c6de883a8a0caef5cc2060f6bdffd864bddc8d"
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
