class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.073447.156de21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-073447-156de21/marvel-darwin-arm64"
    sha256 "5874985f5ebb8fdd10b2c65b71374f982ee310a3d7832d5d2a287bf76de8d933"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-073447-156de21/marvel-darwin-amd64"
    sha256 "3c376f7ea27fc165aae7df6059c85e46f0b4e2ad4d6a1139d91d18e59f249015"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-073447-156de21/marvel-linux-arm64"
    sha256 "0addc64f26999f59ce53ff12aca52e4fffa26a3bae3c2e602537afa94c8d5cac"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-073447-156de21/marvel-linux-amd64"
    sha256 "b4a07cb5b4b63ba8db4a801cc19fa5d35b674fe6219937f87e21dd644015385b"
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
