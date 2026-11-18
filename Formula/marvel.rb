class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.043323.63bb54e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-043323-63bb54e/marvel-darwin-arm64"
    sha256 "e2610630a6ee92fb19e4713cb565b029a1266a3b1cbe1369970e394f1d6c0cf5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-043323-63bb54e/marvel-darwin-amd64"
    sha256 "589e898b40fafa1c54defd50ede3fb6476b2fd7329bd0d7f640dd76b5a71c7e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-043323-63bb54e/marvel-linux-arm64"
    sha256 "aec25955d2b91eb3bf53ac935104dc96d1aecb6b765b6a555f54d91b1b888e46"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-043323-63bb54e/marvel-linux-amd64"
    sha256 "e9c82271ea7b67dfe17a6dda81280a86b137d960d2100fb6a8793401b6de6b90"
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
