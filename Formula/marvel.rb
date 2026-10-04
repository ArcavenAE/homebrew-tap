class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.063343.73033fe"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-063343-73033fe/marvel-darwin-arm64"
    sha256 "6f21e528f92e9a02d70eb4ac7686a0cdf3e7f07189c4a5c7af4894cb1d6ec864"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-063343-73033fe/marvel-darwin-amd64"
    sha256 "1bcd52bbdd57641c7b19143aea31475f46cbce1bf7f1dd241fef5a8e242d4751"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-063343-73033fe/marvel-linux-arm64"
    sha256 "4afcd7f636cb41f479232df7a7e08968d68b04d59ba5cfe1b27d04b97ebfe7d3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-063343-73033fe/marvel-linux-amd64"
    sha256 "37a3d8f554f7a32be4e408fb83cef6e465fc3de98be9d303b49f2d927f864545"
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
