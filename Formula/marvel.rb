class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.182606.177f9ee"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-182606-177f9ee/marvel-darwin-arm64"
    sha256 "f0631b39b8de94da33a02f63b6d2fee7b1fce02b16940fa7ccc4dd0dee331c5b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-182606-177f9ee/marvel-darwin-amd64"
    sha256 "6da4f91d72767169b28073a255ef2168a416cbf41864b79e93240df04906f847"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-182606-177f9ee/marvel-linux-arm64"
    sha256 "742dd46e2e570d689e805b70209aa325b1e839888cf0a3a03c2da632ae5f07af"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-182606-177f9ee/marvel-linux-amd64"
    sha256 "dfd84bd868b31f85d54af77d1a3314dd3d3b8c193cbf3bce3e703a93ebe07e04"
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
