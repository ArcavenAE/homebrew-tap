class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261020.231220.05ed35e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231220-05ed35e/marvel-darwin-arm64"
    sha256 "79c71df69e5f7b83a897eaa421e116ca398a08c299bd3e250763f134f8f33731"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231220-05ed35e/marvel-darwin-amd64"
    sha256 "ebaad1611adcc671a54ce5d0b4b1d74954d20e0f15cb186e9bbc7d010a454485"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231220-05ed35e/marvel-linux-arm64"
    sha256 "f02206da860f29b5d51821e35ca0e3e97bd8b80ea70d4871eb361db37d01309c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261020-231220-05ed35e/marvel-linux-amd64"
    sha256 "51d1daad42bd398eee26c6d852dbf2926b700b17265251f7d583773a71a8b5d7"
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
