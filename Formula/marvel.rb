class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.050421.0c2c405"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050421-0c2c405/marvel-darwin-arm64"
    sha256 "83905b20e315b51a77d0e3ad0c796b3908cb692c58a42d3b93a1f977c82bd78b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050421-0c2c405/marvel-darwin-amd64"
    sha256 "b52a21dd52eb014a8f7ca90d2024bbdb345500a80225784362351099684ebbff"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050421-0c2c405/marvel-linux-arm64"
    sha256 "44a44709e16fa17f284e32c5d12f191edba44be3c0d5bada7008049eb45e89e3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-050421-0c2c405/marvel-linux-amd64"
    sha256 "dc9b5858a9c56c9381d7ca2fac0875323be0f4c0f7c52ef1b9707475b23cce21"
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
