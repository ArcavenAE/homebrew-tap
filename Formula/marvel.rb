class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260513.032515.06474c0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-032515-06474c0/marvel-darwin-arm64"
    sha256 "57d32e699f777d410422f6a779884457eafb2f5da352cd753f7a3f78e9e557ac"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-032515-06474c0/marvel-darwin-amd64"
    sha256 "bb759ac5fa7d10bec839850c170676f2abe8abac95180ee5c58738c929c8daa4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-032515-06474c0/marvel-linux-arm64"
    sha256 "27e5d8c022b7136e6ec1713517f20e73c3c91013032c0f2066ea3be1484846f6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260513-032515-06474c0/marvel-linux-amd64"
    sha256 "b472ad8b7f39f5a76c94efd77177e4c7e18f5e6b466ff3c6033bd19b305e3b7d"
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
