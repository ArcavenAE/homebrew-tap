class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260923.235925.97698a3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-235925-97698a3/marvel-darwin-arm64"
    sha256 "87531a7ba985ebd52e7e53fed8a4af5f1908e49a0ce471c53b852b1f3f001435"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-235925-97698a3/marvel-darwin-amd64"
    sha256 "9634305a8c68e534a3cbc8f41645332850e1c984aa610506b2b2f04d61384775"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-235925-97698a3/marvel-linux-arm64"
    sha256 "31ab0c8b6a0a54d1a4cdd110e68c2689c2fae2593903a999db891982be3136a5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260923-235925-97698a3/marvel-linux-amd64"
    sha256 "f046d3057389ae101c51dfe640a3437b5ea2f5b9bbea33de1a3b5c9bd5600c74"
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
