class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261108.044350.287b04b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-044350-287b04b/marvel-darwin-arm64"
    sha256 "c7a637fddbebfd40d5ea913940d0c0ef35b0ab84ecf8a9050bc9a9bd8c80afcd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-044350-287b04b/marvel-darwin-amd64"
    sha256 "cdc75c9f36131d394544934b099dcdea54aea53ff56539cc4cd41074b9062e5b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-044350-287b04b/marvel-linux-arm64"
    sha256 "1186a9476c86220efd88ad7917617600c3606746bc40292d91b03eb047fdb994"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261108-044350-287b04b/marvel-linux-amd64"
    sha256 "64eff7643e2a670303471d959d5d62f0cdb55bf0cf4381e11a1819050e9e875f"
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
