class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.162706.1ff8176"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162706-1ff8176/marvel-darwin-arm64"
    sha256 "4d302ab7f6eca9ed2cc6bef348aacf37c6fa13e8b7aefb8286ffec62e5127e0d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162706-1ff8176/marvel-darwin-amd64"
    sha256 "1c120d590c5a637d0c61757f19197b0292b362647fafa88625bc239ac4ce5520"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162706-1ff8176/marvel-linux-arm64"
    sha256 "5ad50c6c53350d7cfceea7534975e768c907cd10cd8b152eb8aa57087770d5fc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-162706-1ff8176/marvel-linux-amd64"
    sha256 "fcac649bf5f72ba5990b492c4ebccb5ed45821fc256b0ee304e09474e58127ef"
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
