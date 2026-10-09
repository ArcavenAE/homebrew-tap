class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.023607.16118d3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-023607-16118d3/marvel-darwin-arm64"
    sha256 "56d28ee88962dc3ae0dda8ed726512ad67f1fff1c246ecce5ea712efc21ff4e7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-023607-16118d3/marvel-darwin-amd64"
    sha256 "b7ba2f6a9fd8b5b5d40c952cfbf01d25bb66d45dbae00a3097bf223a1daefa58"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-023607-16118d3/marvel-linux-arm64"
    sha256 "2a1ce366cbb626b500ff3b8a11a6d5dc0d7878b2d65710ce3a34522bdb03d880"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-023607-16118d3/marvel-linux-amd64"
    sha256 "d0138e8467cb69cf347add1695114a2c5184f6d4929299334f6e32708aae6742"
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
