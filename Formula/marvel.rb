class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261118.233516.4b80dbf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-233516-4b80dbf/marvel-darwin-arm64"
    sha256 "d37b0251c9b821fcd4f19acf6b4a0b08ad54ff466728419701e6ef97dd8b071d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-233516-4b80dbf/marvel-darwin-amd64"
    sha256 "ab06bd67fdf5d69ee91e87fac91e3b79421bd34e0f85798f78e7d59099eb065f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-233516-4b80dbf/marvel-linux-arm64"
    sha256 "3fb73f5aebacda24d115b90a90a56d2604d61b441860c362fc2837fe7115a761"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261118-233516-4b80dbf/marvel-linux-amd64"
    sha256 "f58ad7cc4055af0cc1a192f288684d92e33e91ffc627514b442de97d4c1117bc"
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
