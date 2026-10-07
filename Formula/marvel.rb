class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.024956.de1f788"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024956-de1f788/marvel-darwin-arm64"
    sha256 "ff336fc6a471de60285d90df57676b3a2f76984d94bd5445fd4df2a95dbd7b10"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024956-de1f788/marvel-darwin-amd64"
    sha256 "fa8ba5b57a32ef8c8cc5e496563afdb07a232291d488b8a60592d5fbd49c14fe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024956-de1f788/marvel-linux-arm64"
    sha256 "af4c2fbe28995b2554401725109cf0b66862ad2ed7de211ec016228e76d83b50"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-024956-de1f788/marvel-linux-amd64"
    sha256 "18948a393383ebdf9d5250562010b9f528c80e5a6a62c3b38f6862b58dcac0ca"
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
