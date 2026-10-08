class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.172140.535d167"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172140-535d167/marvel-darwin-arm64"
    sha256 "dad9222a9d3cabbe0002c589d22a41f4e83a488b70260663c498175c80fb9f21"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172140-535d167/marvel-darwin-amd64"
    sha256 "b5432aee4961e36849d67c5e10ea2a293bcd95abad3a5aa60c815819b04feaa1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172140-535d167/marvel-linux-arm64"
    sha256 "83f6a735a3c0ae556bb904741934f2c927c85b64b46995c1209b1c526056c4a8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-172140-535d167/marvel-linux-amd64"
    sha256 "2f4d000009aafb6c1a573377429a8a663aabd5fd6adedc794a3da4decd3270f5"
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
