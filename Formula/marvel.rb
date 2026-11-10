class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.141958.337bea1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-141958-337bea1/marvel-darwin-arm64"
    sha256 "b6b1f45c1740d83f1f540dfa6d55da36ee8acdd77e5c9b9f4463e91d0c04ab90"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-141958-337bea1/marvel-darwin-amd64"
    sha256 "8f17850b0c53c38d585f4aebbe3117add67ea92d7c44ab6a9116fe59b78a84ad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-141958-337bea1/marvel-linux-arm64"
    sha256 "c03176abf28807807d787dd2c24b2d936245242c9154ff44a46c3135208fa726"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-141958-337bea1/marvel-linux-amd64"
    sha256 "3657cf870631e4b283fc53766b4d17469b27ff43ca56cdbe260eb73c435f6e19"
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
