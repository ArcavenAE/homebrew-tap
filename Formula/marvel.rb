class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.174858.94bf61f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-174858-94bf61f/marvel-darwin-arm64"
    sha256 "8acf5f18616b1954615e749d0f0bbed3682cd65ae62e88d39c83f9f7d758a594"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-174858-94bf61f/marvel-darwin-amd64"
    sha256 "3bcb123c47cced01cb875581de671e4719add892e8791f743170e1a02f49ca31"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-174858-94bf61f/marvel-linux-arm64"
    sha256 "57326094f1c2132627447a3d5cc67f4f14829d002b83b0b8efba637850940e21"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-174858-94bf61f/marvel-linux-amd64"
    sha256 "be19f035eb1789f54b07ff59b19233af2b69b3efaeee28ffe2fbdfb5aa8a8cff"
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
