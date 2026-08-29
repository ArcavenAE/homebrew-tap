class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.185707.4cd93f4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-185707-4cd93f4/marvel-darwin-arm64"
    sha256 "62a758f32bb2f6c4a598862688f7131b5bdb4ed372bbf1e848f357b835897862"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-185707-4cd93f4/marvel-darwin-amd64"
    sha256 "3291c92f415e28d1a008e32b89686d6a674c08c86bcde093fb47705e0a79b21b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-185707-4cd93f4/marvel-linux-arm64"
    sha256 "2518922c05db9660410ffd42466738a5623b7deac027d413b4bb951c0b2baf45"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-185707-4cd93f4/marvel-linux-amd64"
    sha256 "9486fe64775d83f0869f8f3913b0c85e853ef359b5d88b36d76ff5350c90d1d6"
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
