class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.024632.0435753"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-024632-0435753/marvel-darwin-arm64"
    sha256 "5b4fc72ed45871546316c1746b533ab864f431611bf694dd5a4412f06ca94793"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-024632-0435753/marvel-darwin-amd64"
    sha256 "6c35993447d1c3fcad64eb678608e18bf036b00c0638a989d1e5ca8d5dce4dea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-024632-0435753/marvel-linux-arm64"
    sha256 "4daa3704292aae5e6ab7bc0539657e9a34e7061945bba71f3d0ec8d0ee131eb8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-024632-0435753/marvel-linux-amd64"
    sha256 "e264e24c46fa917776a87d3768dcf723015dd53a7489501343100679b9ff70ca"
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
