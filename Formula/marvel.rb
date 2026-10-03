class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.020430.6c3d5f0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020430-6c3d5f0/marvel-darwin-arm64"
    sha256 "fa2458220007cc6f019ae176acb522574d348820f5ecd80f67342a2bed709e65"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020430-6c3d5f0/marvel-darwin-amd64"
    sha256 "eaf2aeff35e64e00250df3d18d3edfdb46c7388af6710794b2650d09ce0c4157"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020430-6c3d5f0/marvel-linux-arm64"
    sha256 "d0c11cbc2746465b5b80108328c8242d32d4e4106d63bfd1207500546021eb56"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-020430-6c3d5f0/marvel-linux-amd64"
    sha256 "e8dd2d7d8aaacee7d89d96f5b314fa4c1b066ad070bd71b4c08f736b68093f51"
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
