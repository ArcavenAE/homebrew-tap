class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.040345.efee672"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040345-efee672/marvel-darwin-arm64"
    sha256 "e0c861f7f60b61053c7d7b13f68c6556ec03a7321c34afdae98a22c7e4c2eed6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040345-efee672/marvel-darwin-amd64"
    sha256 "4dbfa960be40d12e625e2d40a5b16de6960e9ac08bea607d653c3daeaafa6a92"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040345-efee672/marvel-linux-arm64"
    sha256 "aaadbdbea8c561790d01b470bdae98f179f9de55ce5e6536b253b5b306012277"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-040345-efee672/marvel-linux-amd64"
    sha256 "6e805e254b0fb955ba5e0acb54174d1cd65690c9c16468cc26de7206bb5d0b1e"
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
