class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260808.185049.9f5657d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-185049-9f5657d/marvel-darwin-arm64"
    sha256 "e641d5f5dea428c7298a72230009106a80ec03a3e803c790beffa8f2b42ef73d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-185049-9f5657d/marvel-darwin-amd64"
    sha256 "c834cc485a39a715d10603a9f2968c1056c50a408e46874a98d4304bb3e67fe4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-185049-9f5657d/marvel-linux-arm64"
    sha256 "8aa1ea051e4521351b57248e7623f31d4ba987daba59a71cd13a3014bb903eb6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260808-185049-9f5657d/marvel-linux-amd64"
    sha256 "0cf360a6dfd64ebe7640e40a638ac53398748264b5a001d144708fbe225c4e93"
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
