class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261107.000332.412fdbc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-000332-412fdbc/marvel-darwin-arm64"
    sha256 "12561306ff44a6ad9e0780b73c66e08f64617d86e35684ab752ba5451c5f67e6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-000332-412fdbc/marvel-darwin-amd64"
    sha256 "e1cb21347e2bec9598453b53a59eb95baf508bda8246c46fbb0d8b3e96025f20"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-000332-412fdbc/marvel-linux-arm64"
    sha256 "7fda2896a22ee417451e51c263245e8260052cb8a7c591db89496ca2a6bc0bca"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261107-000332-412fdbc/marvel-linux-amd64"
    sha256 "71d617745874ed141a44474937135aed5d547dfa726ad5f32a6de139bc4a089b"
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
