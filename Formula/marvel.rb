class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.065743.b8cc831"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065743-b8cc831/marvel-darwin-arm64"
    sha256 "31a07f237eb130dae938363ff423e636c70f5b970a84e65591eb3a2d9dba9d3e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065743-b8cc831/marvel-darwin-amd64"
    sha256 "9a7a678b93ef8b0a4ffe8d8244c7a39d8585e80faca9e66779056bc471fc1ec0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065743-b8cc831/marvel-linux-arm64"
    sha256 "ba40d4c073cefd5a4b90b41452ba2129c33ffcc75cb758e6d5b4cd2a9bada80a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-065743-b8cc831/marvel-linux-amd64"
    sha256 "b8045902554e35c60604f68b4f83328ecc2c2f23f19ef25a17bb5baaec9d1c5b"
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
