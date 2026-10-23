class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261023.022549.e76d8da"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-022549-e76d8da/marvel-darwin-arm64"
    sha256 "912979ebf3ecd049a40842412223db1fc27dd9de4063ac5f49e5ee19bae7fffa"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-022549-e76d8da/marvel-darwin-amd64"
    sha256 "d23965065f362906c5152cb7cf9784168465a99b42914ad46605d1ebeea537c0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-022549-e76d8da/marvel-linux-arm64"
    sha256 "3851c195be2ee08d62775dcb7d03aaada8a825f4e9e2a6ff79ebd5886c9dbf96"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261023-022549-e76d8da/marvel-linux-amd64"
    sha256 "2ecbc184813aa05e9cee2511164a35798e0951210c03a970d11256d99dca3881"
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
