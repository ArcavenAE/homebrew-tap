class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.002516.6fe24c5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002516-6fe24c5/marvel-darwin-arm64"
    sha256 "ad29b6c2223ed7d602c5b2f3e35a6d7533ad297f0b47f50bbf2153af2a19d0f4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002516-6fe24c5/marvel-darwin-amd64"
    sha256 "52236b46ee61a8cfde01aa126a09a1b3dbc7149b4cf731226626c4b88b7cbc84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002516-6fe24c5/marvel-linux-arm64"
    sha256 "91721b4f3a5bc7c90ae1c8b8c4965b2af1b7152669a6b50e623f6cde4b386d58"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-002516-6fe24c5/marvel-linux-amd64"
    sha256 "0d6d17bb27edbd8e4ea48bc0e322b836d6a35ebee135c4ca67d31e00c74648fa"
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
