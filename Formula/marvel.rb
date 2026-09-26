class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.163619.c01452c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-163619-c01452c/marvel-darwin-arm64"
    sha256 "6e8fe480b921f6c0d75ecd7814c59db50937994975e196c9f0fbb9cb9102b231"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-163619-c01452c/marvel-darwin-amd64"
    sha256 "4fd2590a4a662a47c516d5d76f13fe8999d72266cf785ae5158d9b625bd7e2e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-163619-c01452c/marvel-linux-arm64"
    sha256 "e868736885787f727910395d5a279e4d3e5ca134fc4d9cf6a2f94cbaa4126f27"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-163619-c01452c/marvel-linux-amd64"
    sha256 "bf53ee9b019743a3ad0b5ec80029c4b8202ae8a0e727a4c22fa367a8500d96b0"
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
