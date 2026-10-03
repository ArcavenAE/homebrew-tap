class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.030336.413288c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-030336-413288c/marvel-darwin-arm64"
    sha256 "cbbbe0fe672ab564abf43c968c217f98265a0672f4dd690c1dfc5f39c9f8c288"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-030336-413288c/marvel-darwin-amd64"
    sha256 "be8fbcfc0c7abfc08baa5750a484c4b323938e513083a783644c857bf1265a29"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-030336-413288c/marvel-linux-arm64"
    sha256 "c2184c9f29c121e793b0e76814fbef5124f7f6139c441bdb13461f1a4f022164"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-030336-413288c/marvel-linux-amd64"
    sha256 "3f0df40543550f1ca56f7b93621839db4fd0e99bef4893676a807e24120abb9e"
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
