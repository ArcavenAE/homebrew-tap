class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.161900.47fe08c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-161900-47fe08c/marvel-darwin-arm64"
    sha256 "22d57e37c256656a64c66a167aa8dfc2716d81bba220580f4f270e17702b76a9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-161900-47fe08c/marvel-darwin-amd64"
    sha256 "a0169cbff3b847ddced7ada1133a3aee916ca9856d0632ae07bbce06fd8bce8b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-161900-47fe08c/marvel-linux-arm64"
    sha256 "86f433418d0a423b192f030c00d7c74ae84d4df81d92c3a32257f253af4fea53"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-161900-47fe08c/marvel-linux-amd64"
    sha256 "9623522e5cf9685a42478d5bf614a6756e0900ddba0383deb1d2fbd76dc920f3"
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
