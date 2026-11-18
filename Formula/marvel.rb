class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.024541.6b3b4c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-024541-6b3b4c4/marvel-darwin-arm64"
    sha256 "2e41a5463ebd5f58023b6fd437f1476fa73097576bfb24f74ee7c3179b55f2d9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-024541-6b3b4c4/marvel-darwin-amd64"
    sha256 "8f951f522e0f673f0588fa79da74ba0ea52800e4ad1d494d505df08cda0fe15d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-024541-6b3b4c4/marvel-linux-arm64"
    sha256 "85f1694ed49185a10e5224fa4301e6075d3d7426ab936f3c0b24c4a9b65509d7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-024541-6b3b4c4/marvel-linux-amd64"
    sha256 "b79507de78fa2459b146e4baa7800e779c45bf0b1d4ab47b0f750c4d04d2b746"
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
