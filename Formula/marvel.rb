class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.050147.fd1cffa"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-050147-fd1cffa/marvel-darwin-arm64"
    sha256 "32e9339c07b6751b2e58d12969a14fdeb72c71621bba045a99b77a2ed1e45bae"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-050147-fd1cffa/marvel-darwin-amd64"
    sha256 "b2d552f049ca3c52068ce96fe5e41c9f464d1aba0a3873fb9039a577aeafcbb7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-050147-fd1cffa/marvel-linux-arm64"
    sha256 "896034b61f9e95191a11123cdd0845db33ccf354a06bea46e3982707c49e426d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-050147-fd1cffa/marvel-linux-amd64"
    sha256 "e435746b9d202a8d73b99b95669c7ec5040b817e8b13f851120aa158e3f43419"
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
