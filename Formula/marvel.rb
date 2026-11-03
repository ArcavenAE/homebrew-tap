class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261103.200447.51c6195"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-200447-51c6195/marvel-darwin-arm64"
    sha256 "71e6f22619cccd11b125106c721b2d233a48f95a548de3bc06795a3d5c8421b1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-200447-51c6195/marvel-darwin-amd64"
    sha256 "b00e5d9147d61ab369bca09521af3f8bc4387f19a1db9c9c13db55654b780f09"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-200447-51c6195/marvel-linux-arm64"
    sha256 "bb5c7ad1f18f6856fa5702382e244b2731b9b840cef830d3ffc53aa4e14389d8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-200447-51c6195/marvel-linux-amd64"
    sha256 "9b609f76467bb637358483447c885ae98cd61a8108d2f1fc648bc570b88e39bd"
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
