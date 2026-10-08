class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.045354.b266e2f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-045354-b266e2f/marvel-darwin-arm64"
    sha256 "5235fc64a4b53eedb9e70f3617e5b389633b905cc274e1ca7d43e1c23633fd74"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-045354-b266e2f/marvel-darwin-amd64"
    sha256 "b6db8bbaac391cbf3d863f7e4734f43decea47ce026bb27bcbede416c792452a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-045354-b266e2f/marvel-linux-arm64"
    sha256 "37722793fdc8471b98324c8bade639e83ddea3ad66b579f4d0134c115f8830df"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-045354-b266e2f/marvel-linux-amd64"
    sha256 "f9cbab6a350acd594541b862699d03d2d947ef852a3b47f03934a639e87931f1"
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
