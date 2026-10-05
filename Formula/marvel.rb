class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261005.163719.dfb57b4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-163719-dfb57b4/marvel-darwin-arm64"
    sha256 "7360ab69cd2b2da8b5e9a7a08dc0bdf3ebd80c0dfbe68405a14d74492bafa38a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-163719-dfb57b4/marvel-darwin-amd64"
    sha256 "b984d1f2e42777826c0d5e08ef8bb052626df4ffd5ae3e3c77333989b3c3bbd8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-163719-dfb57b4/marvel-linux-arm64"
    sha256 "92d6a25743f511e8dd3bf6b6a020bff2ef6899200f82998d985028086c46f0b7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-163719-dfb57b4/marvel-linux-amd64"
    sha256 "47a1dd9d082a8d7b9bab42295d68f07e94cc04014e7851c0d3355aa0c7828a0a"
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
