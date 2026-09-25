class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260925.173323.71f16bb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-173323-71f16bb/marvel-darwin-arm64"
    sha256 "f14a7b0067d252a3e8e23517ac673ff7677031bae61a1b9860ed817b9a041899"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-173323-71f16bb/marvel-darwin-amd64"
    sha256 "d87ca809162042a1ea12ad83c2a64ca54d50a4dd3072d1e7cad6d29eb6e9c571"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-173323-71f16bb/marvel-linux-arm64"
    sha256 "58b810bc54ab1645ccae38a178bc3575892e7e161fc38c41438a2dc2d2d18607"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260925-173323-71f16bb/marvel-linux-amd64"
    sha256 "797f667d197b4439b52da39996ef2318126cb7c62a92670b3cffd45a2f4978d8"
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
