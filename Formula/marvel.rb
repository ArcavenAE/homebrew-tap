class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261111.020348.e23ebf2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-020348-e23ebf2/marvel-darwin-arm64"
    sha256 "fd652371d738584ea3abc8d530835368f776462e18081dabcff0c7063e46bd99"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-020348-e23ebf2/marvel-darwin-amd64"
    sha256 "23af6b353bba3c028929fc484de2c4edba872a1d6ced78160232c95054a246e3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-020348-e23ebf2/marvel-linux-arm64"
    sha256 "814f7a238b8329c8c48b6d2ee38942768023e42f713a3c0136c1f6b5c9b60fbf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261111-020348-e23ebf2/marvel-linux-amd64"
    sha256 "b2b276a25a73c39b10b7031e1d4f13972139d59140f66fc4217b928f2a81e385"
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
