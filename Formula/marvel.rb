class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.215820.4079b25"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-215820-4079b25/marvel-darwin-arm64"
    sha256 "fd3fd2fb75b6945a1c547f479e0a6301e104db1b9f969ab8a1ee9d435c8d841b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-215820-4079b25/marvel-darwin-amd64"
    sha256 "f671a2557f5034242ee1a0633b27f24110b73fc060d2531e1808e9ca2e6224b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-215820-4079b25/marvel-linux-arm64"
    sha256 "24308199ae2cd095d8cbfa92e2e04502739807c3aa3e504f7ea4d071d5b7877a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-215820-4079b25/marvel-linux-amd64"
    sha256 "8ce92c3f3bdadd764c9eda074774c58ca80adbfe7e85989ee6666ab117b81e1e"
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
