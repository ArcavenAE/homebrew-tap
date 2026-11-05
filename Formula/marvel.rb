class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.024656.1b0dab6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-024656-1b0dab6/marvel-darwin-arm64"
    sha256 "4a8dbb96edf7a9ad8854b9a55d5e74ee159963f7b37d00b5456ebbbfba2406d2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-024656-1b0dab6/marvel-darwin-amd64"
    sha256 "1e5e5d9a8181da8757a6b5ebd9e6228309f4ee321fd6b5e951db8a8020cafb39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-024656-1b0dab6/marvel-linux-arm64"
    sha256 "ac007257fb093672a07eda0a78b1510c0d4028fe5af2c88a517f2ac8d48c796c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-024656-1b0dab6/marvel-linux-amd64"
    sha256 "6f955e6c7e3292b95536811681f6facda42ac9f1888726c72cee3f3dd67d9852"
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
