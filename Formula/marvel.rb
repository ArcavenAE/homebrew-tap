class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261108.065257.765009b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-065257-765009b/marvel-darwin-arm64"
    sha256 "1864d960c5a0c7573092a4cad92bc6d75e5ad11712a898c775270e15aec46124"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-065257-765009b/marvel-darwin-amd64"
    sha256 "086bf3c7b123fffd64b0121d1d87e54aea5e28cde4852da039515971ebf823bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-065257-765009b/marvel-linux-arm64"
    sha256 "310afa370fb2750ccb9dcfedb737da0a15d6a1d6396eac2d1bc66013464638a3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-065257-765009b/marvel-linux-amd64"
    sha256 "d7c1ae83712bba0434ac193e435408d01045ee7fa8af8e0ae1b4f9a35c893950"
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
