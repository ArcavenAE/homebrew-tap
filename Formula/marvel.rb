class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.022005.f0dc2a1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-022005-f0dc2a1/marvel-darwin-arm64"
    sha256 "5a2d9f6223eb71fc9d300a3c5c3c69f6a89c195ec55e0df6507a567ae566588e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-022005-f0dc2a1/marvel-darwin-amd64"
    sha256 "2a0a495d8adcc3d65b7a5dddfb67b19d2c0449be7016a16e6c9477ac440db419"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-022005-f0dc2a1/marvel-linux-arm64"
    sha256 "6afe48afa1ae0a7e02b6fb17d6538edeab0d50b5c2c1c76ae96cce60fd2d15a1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-022005-f0dc2a1/marvel-linux-amd64"
    sha256 "96c2cd6854d0fbfc72143d3f3b5bcccc1147ec905462996551930e6c622c422e"
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
