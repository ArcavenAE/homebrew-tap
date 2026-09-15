class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.114726.09610d2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-114726-09610d2/marvel-darwin-arm64"
    sha256 "74ebd69dd22edbb9a04f1a13a1f66131d92161eb9525623ac908686ab5634a87"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-114726-09610d2/marvel-darwin-amd64"
    sha256 "d054dc4f64106ae94853f4a504d2ab2bf1a765a10825ba1bbcc48667c4065250"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-114726-09610d2/marvel-linux-arm64"
    sha256 "20761ea23db4223c92e9b96ed024c1d1696bd5dc1e240139db29d17eb74b4ba8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-114726-09610d2/marvel-linux-amd64"
    sha256 "af3f5d9117c72c703010ec49cd28d96f1be1c61cfaf629daed3343174875cae4"
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
