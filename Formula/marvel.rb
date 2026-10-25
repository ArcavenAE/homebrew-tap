class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.234702.8419e8a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234702-8419e8a/marvel-darwin-arm64"
    sha256 "4df936458cf654248b9bd99ae35ef5f4045a346c05048c1bf53b0c5c304eaea2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234702-8419e8a/marvel-darwin-amd64"
    sha256 "b127585dc552cc9a1c4427d7efad1b3486def2696f1e5378d661b69c0c9f195a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234702-8419e8a/marvel-linux-arm64"
    sha256 "1a02478df6bc9f0e78624425c6254aa108296affb227e91a5b6c48aa42500c94"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-234702-8419e8a/marvel-linux-amd64"
    sha256 "122dccb47a83cc14fd623aab0410ab7c8e84c7d5ac51daea0e25976dcff1bd6b"
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
