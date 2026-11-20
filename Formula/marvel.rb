class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261119.235517.824d074"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-235517-824d074/marvel-darwin-arm64"
    sha256 "e4e2eb6ed42f5799e86ddac6db0ffc20870b55be6e03ec4451203bcf1345e5bf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-235517-824d074/marvel-darwin-amd64"
    sha256 "33c1905867048fd2537def7b6c05983405f6101bdd240ac659017fdde1c81966"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-235517-824d074/marvel-linux-arm64"
    sha256 "57022535e4f4ebea053dc6bf16783ac47e0acaf0137759570623dfef12972522"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261119-235517-824d074/marvel-linux-amd64"
    sha256 "210362119bb536a9e078772c2dbc315a373a734b171999e2a6eb4a572d400d1a"
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
