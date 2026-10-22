class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.204636.ab33e85"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-ab33e85/marvel-darwin-arm64"
    sha256 "6c568776609405676001a472418f1fba384d425c6f6b7c6df854e91a3588564e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-ab33e85/marvel-darwin-amd64"
    sha256 "193b5e25b5457a84e52a26cddf93020266b4b5b574800bede4ec0910532c9c5c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-ab33e85/marvel-linux-arm64"
    sha256 "0d5d5f8e1d37817f3ee695b8f24c75c896a87b734a30018d02016b00dac06b19"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-204636-ab33e85/marvel-linux-amd64"
    sha256 "ab38d34d1d4000ae7b577044b0fcc787b9b1b0199d170368a53e87c6fbabf70c"
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
