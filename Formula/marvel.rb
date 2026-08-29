class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.011721.3e98551"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-011721-3e98551/marvel-darwin-arm64"
    sha256 "cc573a4ad3dcc2aefab6fde82a0a43ea036e90c231dd09fe579036dbacd6b2cd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-011721-3e98551/marvel-darwin-amd64"
    sha256 "87f71b99ec08155e74dd1697c8f4589dba5ddeac1f33ae58b99d592892b4a5a8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-011721-3e98551/marvel-linux-arm64"
    sha256 "ffd117f7232766b7482bab76eb33d7790445fcbb5031242ee0a3f415445891c6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-011721-3e98551/marvel-linux-amd64"
    sha256 "60c5dc3a37bbb1c3377037a80994b12aed8fbae92eacf4ed6a50b9a7cc7cfb29"
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
