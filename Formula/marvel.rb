class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.222207.1ba171d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222207-1ba171d/marvel-darwin-arm64"
    sha256 "084e9b1ef76f4d721b8c550d8aeb9a0356b98032c0b5b53c3efd0df8f9c0ddf0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222207-1ba171d/marvel-darwin-amd64"
    sha256 "3f2c074d2eed7568bf75f883026451a3a4790827ee7d6fac3d9622cd7bfd21d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222207-1ba171d/marvel-linux-arm64"
    sha256 "48c282399bada64b777d5ce8e34f4b0601b0857d6accc67f0143f5a254520e66"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-222207-1ba171d/marvel-linux-amd64"
    sha256 "4e51fd37b5293dba1dc417720049eaad6e8a2f2777f62ca6d02ddf2f137b2421"
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
