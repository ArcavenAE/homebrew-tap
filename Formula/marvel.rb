class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.064935.ce4815f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-064935-ce4815f/marvel-darwin-arm64"
    sha256 "732954ba37edc54e8938b87c9f318ea0f96b23f7dc9e036fb639a823c071110b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-064935-ce4815f/marvel-darwin-amd64"
    sha256 "1485b12d5cb568a3fdb05cdc4c16321b229d46983d90cd1fbd188bd9094d59a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-064935-ce4815f/marvel-linux-arm64"
    sha256 "dfc83191ed5ea5807a5b552538bc88fc1f176ef5ee4a9ad443a75b58a6d43f0b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-064935-ce4815f/marvel-linux-amd64"
    sha256 "a995ed02cdea377ea4d0a11fd3b4ebe3f47f444db0e57867da0b295d2458a5a7"
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
