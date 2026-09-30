class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.184352.0245681"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-184352-0245681/marvel-darwin-arm64"
    sha256 "98edf2134ccd31f5336370bc33caf3aa316ec88b66b17dbc099d93e88c5cc8e0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-184352-0245681/marvel-darwin-amd64"
    sha256 "9f3f3301accd56eb03cd0b3bb2d30f3e8086ccbcf5c3cd451ac12c2327bad138"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-184352-0245681/marvel-linux-arm64"
    sha256 "586cf43177d509f98d1265b6d19e48284df68c9eb14a236e9fdac76e89796b8d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-184352-0245681/marvel-linux-amd64"
    sha256 "03b5200f29bedd39735270203a9c8657cd2ffbfae71d62de034db60e1ab80c2d"
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
