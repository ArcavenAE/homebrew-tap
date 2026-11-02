class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.140449.553c1ee"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-140449-553c1ee/marvel-darwin-arm64"
    sha256 "d475a41c100535447145b9ad578305e886750d6f215305f3e2a859850c0ab1d8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-140449-553c1ee/marvel-darwin-amd64"
    sha256 "adef5f7e1514b1686dbe8420cd246d27a4e5646b7360898bc7111f468ac95c14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-140449-553c1ee/marvel-linux-arm64"
    sha256 "078afa1f6e12d6a06de0e852f48c0893a0de60184e555f9dd56ecae159d77ec1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-140449-553c1ee/marvel-linux-amd64"
    sha256 "fa1064223379a923e78b0cd06f0b5909e6d2a464f9927721e7f245b8bdcbc809"
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
