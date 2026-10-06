class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.141859.79ca80f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141859-79ca80f/marvel-darwin-arm64"
    sha256 "6bff4eaa33b3dd7d10f49ca76e7728c919910d502b0b7d106884ca46c7c8bf93"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141859-79ca80f/marvel-darwin-amd64"
    sha256 "0a03cb987ce53f4d96bf37be145809366fe6a58e03f09d80add1da481a91afe8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141859-79ca80f/marvel-linux-arm64"
    sha256 "fcf846fa2327c6e05631b740c13c03efaab7b267c5a1dd34c3787980de61fe8b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-141859-79ca80f/marvel-linux-amd64"
    sha256 "3493ce8af8e6b7194fd693809eb897d2da4338b032b86ab4742113ca0fee5ca2"
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
