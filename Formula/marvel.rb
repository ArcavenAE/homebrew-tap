class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.072917.6441f8e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-072917-6441f8e/marvel-darwin-arm64"
    sha256 "1ef2c5b0c529e92a30194952507b96875b0f4405f551a38d6984f7b4ad99c1d1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-072917-6441f8e/marvel-darwin-amd64"
    sha256 "346a94d1d4dc940adc25a31c036a7af280cc6df7b66ca8c998a72f8c36bd376e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-072917-6441f8e/marvel-linux-arm64"
    sha256 "8d188e291208bb2ec01662e40a992f51b3f9cabe3bdfffc95faad0c9cb1a3dc9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-072917-6441f8e/marvel-linux-amd64"
    sha256 "461638e3d9ce365ade6dc0f88413bde59dd21c92f1769b761e9e6d907296c7a2"
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
