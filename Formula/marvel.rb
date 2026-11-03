class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261103.062543.405e422"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-062543-405e422/marvel-darwin-arm64"
    sha256 "276678facbcf6957c785e84f23f86df3f45eda01d3f6e2393a09100d92a605b8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-062543-405e422/marvel-darwin-amd64"
    sha256 "e8bf011bbc45d947f81fe6213a4c5f79911acbe90193edb17a252b5b081966c3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-062543-405e422/marvel-linux-arm64"
    sha256 "cf32095140d44ad2eda00476dc2e0340c400e8cfb82924c961b16b2b0e6e7c9f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-062543-405e422/marvel-linux-amd64"
    sha256 "a4e3c75c9d3f08ac2f2f95508d830e215607b8f9a48952099422f6945787124f"
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
