class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.225511.0a1f211"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-225511-0a1f211/marvel-darwin-arm64"
    sha256 "036265b6c6e3c6ffe404d5fb04d8e9cbf15176c5b2752ee2e2c21d0cb05ac3df"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-225511-0a1f211/marvel-darwin-amd64"
    sha256 "8b5e3a2c9fe253912cb021785ba169f6a12399bd686246872903c62a1271da64"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-225511-0a1f211/marvel-linux-arm64"
    sha256 "9f3c4570de16c68c09259691388645a2a806b7781a0aef1b7ec3124b1b705db1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-225511-0a1f211/marvel-linux-amd64"
    sha256 "ce1316877d3e6cbd3ab9ea4247a8441f5af279b13792f60bdb98bcd57657c78b"
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
