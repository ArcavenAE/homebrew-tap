class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261108.052653.c0952ac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-052653-c0952ac/marvel-darwin-arm64"
    sha256 "541e9756905ff7358604af96f0866ab0365bf57000543e0f752dcd0395118320"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-052653-c0952ac/marvel-darwin-amd64"
    sha256 "3f85fc4c868ecfed67755c7553954eeef73edd09a26e551c1b8f45a41d532077"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-052653-c0952ac/marvel-linux-arm64"
    sha256 "4d009da33285cd9583f23a8ea5d24a3a6d416a9903ace450de80d6e312658a40"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-052653-c0952ac/marvel-linux-amd64"
    sha256 "5379962271cb7fe1565e9df8e162e079b40ed65e08bd379aef410e71347d6f69"
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
