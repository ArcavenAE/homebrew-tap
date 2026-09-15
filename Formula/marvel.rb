class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.164011.422eb11"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-164011-422eb11/marvel-darwin-arm64"
    sha256 "6d928456c8864fe6bf2339869219dcb4bb258599cc35360d3f8722c325a8f305"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-164011-422eb11/marvel-darwin-amd64"
    sha256 "61385d2414cd14d374ee5fe225ae18643e88fbf9845a731578401dce6373aa35"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-164011-422eb11/marvel-linux-arm64"
    sha256 "1995f1583c3546caa6ac94e440b3745eba3d33d5ce28fea3abac05c25a414878"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-164011-422eb11/marvel-linux-amd64"
    sha256 "ac7f0def09998d4abb5c0fc4b7cab639c593a5ae0bcd852bfd26d6ecd857e926"
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
