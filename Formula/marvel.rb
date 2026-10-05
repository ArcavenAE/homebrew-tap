class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261005.190812.efaf987"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-190812-efaf987/marvel-darwin-arm64"
    sha256 "50c5857cdd3e1ce5499e03715a542bef17294866ff8995a1e45521139df639b8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-190812-efaf987/marvel-darwin-amd64"
    sha256 "35d3e95cb9f0d0e2aba62b725594890ba8ffc4bef5ba48fcaaaaf8b16a882b93"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-190812-efaf987/marvel-linux-arm64"
    sha256 "6353a1ac9c6299602d11c09279eaea7a0c364ba58b0aa26a890493d7ec7dd858"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261005-190812-efaf987/marvel-linux-amd64"
    sha256 "8761052afea3c91934365679f56c3b08307d5d598cf6fe793e6b21362fc3c482"
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
