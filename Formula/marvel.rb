class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.144911.e62f25d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144911-e62f25d/marvel-darwin-arm64"
    sha256 "0fda9144e6fd6786a17c2c0f53b4fb323a34ccf0cc55b76387322b2011018d87"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144911-e62f25d/marvel-darwin-amd64"
    sha256 "9f5cd412072e034408049ad5e5a930f551848c4b16e4bcae626054098e677846"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144911-e62f25d/marvel-linux-arm64"
    sha256 "72d135082df45e1f5faf14f13807da4e0ce2f80e79281663410628bb453c3d27"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-144911-e62f25d/marvel-linux-amd64"
    sha256 "cbb34403d4b64ff6f01665b36f0127b28271d586c700d422b43d5948ba754bbf"
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
