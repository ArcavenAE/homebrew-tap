class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.182201.7e0ff0c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-182201-7e0ff0c/marvel-darwin-arm64"
    sha256 "08fcc8d65f0426c8eea5b4cdf8a081f4991b5c2c82383e64d6f577e56aec5224"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-182201-7e0ff0c/marvel-darwin-amd64"
    sha256 "b60d6ab45542e4e5aa48d0f24582c6b38c5ceea6057da36ac7221a908b8db645"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-182201-7e0ff0c/marvel-linux-arm64"
    sha256 "a419b8e48ac657ecd919469698d18588a0c0d20c5cf29f83222151cba7a240ed"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-182201-7e0ff0c/marvel-linux-amd64"
    sha256 "09a36af0055a27fd632459be251adf92dba6e855a5e91d9a3c58651b3c22a13e"
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
