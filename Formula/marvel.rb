class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.181817.411db87"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-181817-411db87/marvel-darwin-arm64"
    sha256 "4ff18f4e03668011e76ae8f3f227f5a974ca5a01bb01c90414e9d37a580c9f9d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-181817-411db87/marvel-darwin-amd64"
    sha256 "8dbcc3d4da872cec605d7d67b08be7b552bfc2676760f8277fec6686bff6ca5d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-181817-411db87/marvel-linux-arm64"
    sha256 "65bfc592c02d8700ff26f6ffe5bfb01fad88d267395b65d6524850980d30161e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-181817-411db87/marvel-linux-amd64"
    sha256 "68ae4ef65d3c147cdeb7eb54871c1dd8c8805790a3a17b5393c46af54375a472"
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
