class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.220129.c0aa9eb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-220129-c0aa9eb/marvel-darwin-arm64"
    sha256 "2edeedecce767c12cc727f6aa5f7c2ba0e68f3dc75d1f78a64b85ac58b3b154d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-220129-c0aa9eb/marvel-darwin-amd64"
    sha256 "557ac45bafb965705af62fddb54adecb6f4a2ae7ff719ee7c9615ff8c22f26e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-220129-c0aa9eb/marvel-linux-arm64"
    sha256 "8d45c84f9661132321ad986f2809cae7bd90220a0bade782561cd1de6eab0847"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-220129-c0aa9eb/marvel-linux-amd64"
    sha256 "eb74326d043b93fc802346eca8deeac35f9354264a3f29815e192d9e56e76f5d"
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
