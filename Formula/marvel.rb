class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260815.082658.fe90430"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-082658-fe90430/marvel-darwin-arm64"
    sha256 "005efc79b9ce7cb5343ad18504f578675973b52812e653c91b576ca12334f97f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-082658-fe90430/marvel-darwin-amd64"
    sha256 "6199a08f6b0f416f8c8821c708aa2f970da6d1df64eae1c796a6768bc43b3dcb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-082658-fe90430/marvel-linux-arm64"
    sha256 "5e706472c6194df1d680433ae1b9e62b0d2076f86c17d2fbc9be25f3a858f0ff"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-082658-fe90430/marvel-linux-amd64"
    sha256 "9043ede34b5902f1c881a2bb19673f0ee6446b305b8dbc63e290850251db29ff"
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
