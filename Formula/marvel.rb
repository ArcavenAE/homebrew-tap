class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.173706.25e17c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173706-25e17c4/marvel-darwin-arm64"
    sha256 "083af127ed53c1708f1e36a07da6dcc639358909b7dca7611850c5106e4ee25c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173706-25e17c4/marvel-darwin-amd64"
    sha256 "91e66becdc45926e75372d2134153c1c39080802fe2a04c86c0daed7b1cb0eed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173706-25e17c4/marvel-linux-arm64"
    sha256 "32942480fef9f7d74aa2c467ecc565f5be28fdb999e9ded4d3301b7b626db474"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-173706-25e17c4/marvel-linux-amd64"
    sha256 "001c349ce929039a4afb27c727aa749a1887995c59d6dcea92278796b6a8081f"
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
