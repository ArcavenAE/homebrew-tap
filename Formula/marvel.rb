class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.014522.b8f1f4b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-014522-b8f1f4b/marvel-darwin-arm64"
    sha256 "d3d77c31f1c67c1bf13fe4bc6aec541e0c8667900994ab597cea9ef4a93d735e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-014522-b8f1f4b/marvel-darwin-amd64"
    sha256 "1d813432dddcd9ba913d72bece3ef1c1e505a4a014a6ac82224c21abd771d1b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-014522-b8f1f4b/marvel-linux-arm64"
    sha256 "e8640443b905c8a462e021ed07f7b3e7b612e6c492c4ed19a86051af02684cd2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-014522-b8f1f4b/marvel-linux-amd64"
    sha256 "caae036ad36f029ea2b5c1d465dc53ab1b73178e4a7ca2927465294fd9e803cf"
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
