class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.172706.a7e32b7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-172706-a7e32b7/marvel-darwin-arm64"
    sha256 "060b23f90e4019b7bb88881128f9fd7f20dc67fd41ebfff77db30c8bff6a0e54"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-172706-a7e32b7/marvel-darwin-amd64"
    sha256 "84fb24be7aeb777b6324c4fe6ee6868171d965bdbe4862db13fb80d8bc37ebe4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-172706-a7e32b7/marvel-linux-arm64"
    sha256 "4a675abd72ff7ce26958b2cb7c2d3ee042f4e03d1f841caac9246eb4d948c4ed"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-172706-a7e32b7/marvel-linux-amd64"
    sha256 "914e7d81d9efbeaa2a9c45d1370c0d66807941d16a933d847d56d8d27cb090aa"
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
