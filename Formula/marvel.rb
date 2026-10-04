class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.171840.1c7b4c2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-171840-1c7b4c2/marvel-darwin-arm64"
    sha256 "7509192617adc8a8f901e3f89a68d21cff0ba2c2091bfdcd21d19d7ea02eca3d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-171840-1c7b4c2/marvel-darwin-amd64"
    sha256 "d845ca8c90a57c484382e0c390eaa26da4fc01ded3f1a0a3d5674899e7bcced5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-171840-1c7b4c2/marvel-linux-arm64"
    sha256 "da30bd1717d3a0ad8a43671d317a4a11cd510d235c0989843a8d725b51816540"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-171840-1c7b4c2/marvel-linux-amd64"
    sha256 "d984efb76cc6e6cfad7d76a32fd945a5beb1c48f0f2118014258e3488069f332"
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
