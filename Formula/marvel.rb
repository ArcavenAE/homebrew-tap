class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261013.222750.c6a64ae"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222750-c6a64ae/marvel-darwin-arm64"
    sha256 "cc8a2af0a41d055e838dd2f8f486916683a8807d8db1caf682a62ba31d0615ca"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222750-c6a64ae/marvel-darwin-amd64"
    sha256 "6b3b4e487338ef82e4d7f52a2c0bbc4e1fc356c82fd44afca6a1811e8fff32c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222750-c6a64ae/marvel-linux-arm64"
    sha256 "c2cfc79fb8bc587e95536c99db2970654ec777c197910ddbb99ef09048775571"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261013-222750-c6a64ae/marvel-linux-amd64"
    sha256 "ce43fc917208abe64b2bf8d41bbd0e76ef34e2408ab7b9540c59d0d1048d9575"
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
