class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.202816.c618518"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-202816-c618518/marvel-darwin-arm64"
    sha256 "67f1e22aab32587c93ddd64b0f5029370fed61cf2ec75e8d41f24d982608c1c1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-202816-c618518/marvel-darwin-amd64"
    sha256 "1e0488d45b69d2cf3b1c49545995538d75c86c3fc96cf366d7e193c425294741"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-202816-c618518/marvel-linux-arm64"
    sha256 "3add5ccd5ddf056517b3a4530f0c3f69e16512cb382b86ba072ec70aca8baa43"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-202816-c618518/marvel-linux-amd64"
    sha256 "1aeb8d5786b29177ba625bf11aa076b8424349ec321af9151fc9b224e43db5d9"
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
