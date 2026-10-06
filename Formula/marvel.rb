class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.210211.0006250"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210211-0006250/marvel-darwin-arm64"
    sha256 "766deec7cee4d2cc6d5f1b5383dad9675f635827a1839d30459678f01320b56d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210211-0006250/marvel-darwin-amd64"
    sha256 "361f2eb093c1557d7e407e61748b5e4d45301b59d2fe9004dccc8d68eebf480d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210211-0006250/marvel-linux-arm64"
    sha256 "cde872ac26504c2b144b125afa6478576d033b77260745bdb80b0865d87ec13d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-210211-0006250/marvel-linux-amd64"
    sha256 "7747109106be6db24fd67b4bf54d0ff1851dbf865992c1b19fa891d7303a111f"
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
