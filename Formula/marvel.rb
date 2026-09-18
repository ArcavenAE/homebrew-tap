class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260918.020516.9c601fb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-020516-9c601fb/marvel-darwin-arm64"
    sha256 "f0f7b567baa1912c0a1b5f57dac0dd1cc0d715a0f8a7fea1892e043536a93c3c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-020516-9c601fb/marvel-darwin-amd64"
    sha256 "e027c54eb5b8a38c2fabd9b440ecc3ae4a72d001c111eaba9bc54ecb24e97d61"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-020516-9c601fb/marvel-linux-arm64"
    sha256 "fa50d744f80d1769a5d7eb668e81c77a1e202ce987692dd79f403ab994b1e31a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260918-020516-9c601fb/marvel-linux-amd64"
    sha256 "0341458e5db65e27431e93d129f6c45bf47145c7f90f3a4680d44989dc45f2d8"
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
