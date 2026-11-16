class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.212428.af1d5e4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-212428-af1d5e4/marvel-darwin-arm64"
    sha256 "a42232b8340666222780098a2c7166b7a5de101beb4ad7fac3ca5028447cc737"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-212428-af1d5e4/marvel-darwin-amd64"
    sha256 "4c30ac119c473160ccb78e238ed7ed8ef72a3cfd0356647ef0b5ff3515974a43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-212428-af1d5e4/marvel-linux-arm64"
    sha256 "e58b4c6058605ddb097245d6034bc584517b1707124f03b37f8fa26983520c53"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-212428-af1d5e4/marvel-linux-amd64"
    sha256 "6b9ac59e0e55645cf03f5b3b357e3f6a30d4f9587478914a8ed3ed17c144b4ee"
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
