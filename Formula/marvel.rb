class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.231214.b533ca5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231214-b533ca5/marvel-darwin-arm64"
    sha256 "52afc4f45036808a59bc72d7f1ec86c96ce2e0ae357387adb2d4b3885f992486"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231214-b533ca5/marvel-darwin-amd64"
    sha256 "3c63836dbe705a3c08787c6967acdc1022ea1cbd5c00afb75f0db08bbca04ba9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231214-b533ca5/marvel-linux-arm64"
    sha256 "177e849c7ecf7afa9d52f8c058e7dc9f9d0f8987a3fb0038dc3215c4d26f00c7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-231214-b533ca5/marvel-linux-amd64"
    sha256 "9798e01c80e6f5243f65b4124ada782d9fefed1b8b90ad7d3e2325284c44b75f"
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
