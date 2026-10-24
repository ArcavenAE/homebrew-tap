class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261024.230027.381e421"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230027-381e421/marvel-darwin-arm64"
    sha256 "756b14145a1cbc50be5bd3bc6d667eec299fb2809d252e57e233a99ee6f5a5d4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230027-381e421/marvel-darwin-amd64"
    sha256 "ec3bfb6dcb6f24459720835805f86ddc294a75f29cd20a90380f0d7f6ba7d1bd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230027-381e421/marvel-linux-arm64"
    sha256 "159e28b26cb41467b186d845f3251cc9d9702fd483d6fef5ed2542a511a73526"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261024-230027-381e421/marvel-linux-amd64"
    sha256 "b168bf6d9a8e9de2344fe0da7d532f50aee57a25f3515ed083115e38450c13a3"
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
