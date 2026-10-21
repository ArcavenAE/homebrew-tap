class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.171358.3955aa4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-171358-3955aa4/marvel-darwin-arm64"
    sha256 "8981262181671ce64cd70cbb5b90d3b2fe1b20573ab2e8a00ea86c56f1e3228c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-171358-3955aa4/marvel-darwin-amd64"
    sha256 "3863f10c64feb5b58c85344b9e86ab311c344c8359395d1a7a988179575de34c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-171358-3955aa4/marvel-linux-arm64"
    sha256 "74dac3a40c3ff8f6028e53b21dcfc5f6d74d898fb160b63a3c563e589fac5e99"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-171358-3955aa4/marvel-linux-amd64"
    sha256 "cf7e91fd0211c871259dbadbb2b6f76b8b9ec507a6b8bcd066b2d29c02bf203d"
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
