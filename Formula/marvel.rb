class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.182451.90b763c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182451-90b763c/marvel-darwin-arm64"
    sha256 "2755e844f5a81c7da41f48db5979bdc60564ecb7308b431b80cbdc6f222ae84c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182451-90b763c/marvel-darwin-amd64"
    sha256 "cbae529e684f856d508ca3a7209b9e92ff099f6c1fe9c2f5b0aa9bd478cca694"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182451-90b763c/marvel-linux-arm64"
    sha256 "d860b59b239571b0d287f92be614783234f0aa7a3c8f60a5a7ceb34baf792294"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-182451-90b763c/marvel-linux-amd64"
    sha256 "cbea928afdcb8c8befc9af422dba2675850b432b21fbb36756be2bfe6ffdb8b0"
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
