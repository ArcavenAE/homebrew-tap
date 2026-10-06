class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.184638.753181a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184638-753181a/marvel-darwin-arm64"
    sha256 "5d787694244235a91e2b078b05745fb7e9f23df2f161f7d2b7ae1165e31204e2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184638-753181a/marvel-darwin-amd64"
    sha256 "2f2f6c78f28effe7fcee5a317b1fe3f4629bb022ccd3198608b0aac244500336"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184638-753181a/marvel-linux-arm64"
    sha256 "6acf2682455747448b9478d6b11b4a5bbdf0cf206700df870bfe22747216fca8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-184638-753181a/marvel-linux-amd64"
    sha256 "71bd9f013dffe5eb7b1a37be89dab73382f0a40cb1c344cb1d6d987122f78700"
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
