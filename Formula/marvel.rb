class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260815.061032.1cce986"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-061032-1cce986/marvel-darwin-arm64"
    sha256 "fad1f4eae6bdedba632e28e21002004bed698bb7bf810676a5918ef66faec948"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-061032-1cce986/marvel-darwin-amd64"
    sha256 "a42cbff5c3839cc361463e2d907ee68242188598d5ccc79efb62a5f0f4230aaf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-061032-1cce986/marvel-linux-arm64"
    sha256 "7801776439f948e98a50dcf8ff67424a27a454ab1e54440215f71a169733c125"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-061032-1cce986/marvel-linux-amd64"
    sha256 "15a6b07595d0e33d6cd60fa73c8b622bad1d329a2578a6ef385970eec8c387e4"
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
