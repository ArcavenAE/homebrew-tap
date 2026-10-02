class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.224636.7f60528"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224636-7f60528/marvel-darwin-arm64"
    sha256 "800eac58622ef757a24a7b3004c1d1a2d0a0f5f2c452867c0cd8dbdc38c45f17"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224636-7f60528/marvel-darwin-amd64"
    sha256 "def28f4d329f8dd993b2d62beb5b0887a1e2e008d86c561a21e024ccc7732ec5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224636-7f60528/marvel-linux-arm64"
    sha256 "09dd43fbade47f0d6ce7cf83775f2d74a4b6290147ccc29e68437b336288eb0c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-224636-7f60528/marvel-linux-amd64"
    sha256 "764cef0e47bc8b5cd1f03d33d7b06650a865ad645a04a03c516f9e215c7a67a3"
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
