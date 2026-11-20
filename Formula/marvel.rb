class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.054219.8559dcb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-054219-8559dcb/marvel-darwin-arm64"
    sha256 "bac3bd640e27517501e5e4602896ee6e29bd32e3627327740fe2f122909a21d9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-054219-8559dcb/marvel-darwin-amd64"
    sha256 "9578fd26e078a6308111d646d6daa21738d3df9d5d79e6805b803095626594ba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-054219-8559dcb/marvel-linux-arm64"
    sha256 "3346813b31f6a9281affc5ec439039e3961aa9739259e9246aa6b0523de54f92"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-054219-8559dcb/marvel-linux-amd64"
    sha256 "f88ecac2aa34f21593110e8ad550605e7b37f6b3314693974e14beb22023f268"
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
