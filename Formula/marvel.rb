class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.054940.f5dc1d0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-054940-f5dc1d0/marvel-darwin-arm64"
    sha256 "252ca9d1dbfff2a81debd90f0bf12bc9dd66e16deb2c60d1f2fd158ca28001d0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-054940-f5dc1d0/marvel-darwin-amd64"
    sha256 "d89204018fa7d9f6c38a0144ab70a1fd6ee6f238f108ed442ddb9976449a98f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-054940-f5dc1d0/marvel-linux-arm64"
    sha256 "3e586aa24664ddc44547ec6565173f8d178e200ec516678240d4028345f777ba"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-054940-f5dc1d0/marvel-linux-amd64"
    sha256 "542dfaf04cf0949213a3bd392c36a8bf6b9b957c9d83f5f8307cc34e0dae74ff"
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
