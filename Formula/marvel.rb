class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.172529.87160c3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-172529-87160c3/marvel-darwin-arm64"
    sha256 "c38be6400ff53c57277246ac4fa7c952d5038e7a0ef1cc11a04b289bb91af6f9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-172529-87160c3/marvel-darwin-amd64"
    sha256 "dc283eb56f569821d06c1f1d322f7d6ce83535c4be06351249be4781b081b5f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-172529-87160c3/marvel-linux-arm64"
    sha256 "cfc0dcd2caa711aa9ba9247c30876f1ce82e0cd659b633580bd2a61c1d9302b4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-172529-87160c3/marvel-linux-amd64"
    sha256 "1dd8872cccb2839722cd0a19b0f82ed77f066f938c4c236c2e296386f6d05927"
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
