class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.180822.4adf90e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180822-4adf90e/marvel-darwin-arm64"
    sha256 "afabb35f905329bcff452b0610f05950f0dd224daa057d0184b021aef7c37aba"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180822-4adf90e/marvel-darwin-amd64"
    sha256 "8ee0898dd5f905932abab0a86cff9475cfd8b94d5e38f73f9df02c18d1763627"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180822-4adf90e/marvel-linux-arm64"
    sha256 "6b8f8c6242efa03e71302c6688bebe5fb990448b1c8c1eeca3254c8914b7fe28"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-180822-4adf90e/marvel-linux-amd64"
    sha256 "b07bf91a509ba44abf8ceaa8f152278eed9dafe34d74f588b20db13e133796b6"
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
