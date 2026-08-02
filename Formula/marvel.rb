class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260802.005623.a673887"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-005623-a673887/marvel-darwin-arm64"
    sha256 "fad6a696feb06c5f0314fe0d1f5ffaad2a9e402bc0a3af5aea970f04c2214526"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-005623-a673887/marvel-darwin-amd64"
    sha256 "ab7f34fde1915b707c1da2cb39180784185e2262af6758fc60c3ad7fcdf51cc7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-005623-a673887/marvel-linux-arm64"
    sha256 "5811f52b6958636c77e3a945d3ef6c221f43f2582057c781fae1053959c56851"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260802-005623-a673887/marvel-linux-amd64"
    sha256 "ed830359f3725dcf135e97dedf13fc85fdd105527e74bed71f4e4288e593fe57"
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
