class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261107.030203.be0f9a7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-030203-be0f9a7/marvel-darwin-arm64"
    sha256 "b1765aad3c41e438a1475965b79e772281712d4c892b79ac3dd324d233d8d508"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-030203-be0f9a7/marvel-darwin-amd64"
    sha256 "c9a367c38165b9f466af64ccd374c3ef3083027f37b03827b64a6f9e658112c8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-030203-be0f9a7/marvel-linux-arm64"
    sha256 "675191ccc0963cc418627824e037b43343cee67deca8502389d292374ea4b26b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-030203-be0f9a7/marvel-linux-amd64"
    sha256 "04eb9664469c0752db8d5d9781bd4153cb286ee1abefa16ddac36940b4397290"
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
