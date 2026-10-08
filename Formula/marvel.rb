class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.140459.b07f4b5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-140459-b07f4b5/marvel-darwin-arm64"
    sha256 "ba0314432d6300d433a06c37f1f2926bea564528b1b2d0a4f27c265092ed9bcd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-140459-b07f4b5/marvel-darwin-amd64"
    sha256 "1e1f99e72b69cd1ce047992d1cfdc5d31d376545df2670ca0554c7a54a3880a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-140459-b07f4b5/marvel-linux-arm64"
    sha256 "6e20d458c2d2f0c8e5a65975345c942c3270fb2aa2cc52a6bbc54732b7666434"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-140459-b07f4b5/marvel-linux-amd64"
    sha256 "af64641bf874f0b9097d73d08a4324c64bd34a3c5557f7272fdd067e0c1cd9e9"
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
