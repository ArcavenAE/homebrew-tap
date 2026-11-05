class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.162633.160b632"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-162633-160b632/marvel-darwin-arm64"
    sha256 "ee928edb5398d2d62e27b4377687c36f9cd0339e9406913525b788ccdbed8bb7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-162633-160b632/marvel-darwin-amd64"
    sha256 "6b71a6d0d8316552b1ad5b6803ffade1e15b57f284ce40e77eb1ebaae1eeca1f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-162633-160b632/marvel-linux-arm64"
    sha256 "864fe6d8b637ee85da17ba161ddf67c053010657127d4f1d1c6ccc11dc79d263"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-162633-160b632/marvel-linux-amd64"
    sha256 "829b484f441f8217a4c3d50b08da52109fcc7d4eb55647ef7f97f82e04ef5ab5"
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
