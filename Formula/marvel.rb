class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.002350.35e9820"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002350-35e9820/marvel-darwin-arm64"
    sha256 "092fd9f96bf66f7b81ac45bebe83aab5a852ab28bd2379969a2055211cdfbf67"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002350-35e9820/marvel-darwin-amd64"
    sha256 "b1da2054dd1ee6dcf3225ed13d4318449ff6562870809d84be488af485162c93"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002350-35e9820/marvel-linux-arm64"
    sha256 "657ffd9a0268c74f237fa04da1390035896fef08de7d205223e2b91b1570a989"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002350-35e9820/marvel-linux-amd64"
    sha256 "b353decf0060c05809cd204e5d3304e2053c8fd1874f96b6664bb52a113a9425"
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
