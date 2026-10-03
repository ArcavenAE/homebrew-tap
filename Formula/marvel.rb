class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261003.133332.8186043"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-133332-8186043/marvel-darwin-arm64"
    sha256 "4f888aa8ba69524ca4e965b4e52928697f37164bbaecbf878e0e23b2295ab0c0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-133332-8186043/marvel-darwin-amd64"
    sha256 "ab9496a2bc9729e4c252a383b4801479bd7d2d8d6e9c0673cf050a5f9013ee62"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-133332-8186043/marvel-linux-arm64"
    sha256 "072e12acf087575fc9540cfa1c06fc513539b00ff7c9f6642c4257a399216f0d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261003-133332-8186043/marvel-linux-amd64"
    sha256 "bb33225c5454b0444aa031c1039acbb12ff0dc9d57d09a78d65da98433226a73"
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
