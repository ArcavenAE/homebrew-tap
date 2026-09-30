class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.160742.61f3237"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-160742-61f3237/marvel-darwin-arm64"
    sha256 "7b76d9d2960482b994aed3258ae34e88399cd1f3b4a7d6eacb2c9604608c1677"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-160742-61f3237/marvel-darwin-amd64"
    sha256 "11dcc89ea1a1abda33f093bba4ccd07e249507fbec1e5cfe874b58c18fe7945d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-160742-61f3237/marvel-linux-arm64"
    sha256 "4f8fb6126ba8bfe09209a2fffa78c11e0d2a9d930be05f897cdab040a019539f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-160742-61f3237/marvel-linux-amd64"
    sha256 "126090862f74097388961bf9d082579c5b73f73c32dc85be0ebc6c0375782976"
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
