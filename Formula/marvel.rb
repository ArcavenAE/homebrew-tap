class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261022.191522.162721c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191522-162721c/marvel-darwin-arm64"
    sha256 "95555d5030fa98f5846d47881f07626c908dbe5fd463550800b36dc465501415"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191522-162721c/marvel-darwin-amd64"
    sha256 "d7b3214444ac3045d75ca10d796e9432826e15ee5157dc206f13e71645b0519f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191522-162721c/marvel-linux-arm64"
    sha256 "aa47ad1fab4b0c2f2719ebd1bcb5a302a263e8abf8becb18dd11fcf5cdd76666"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261022-191522-162721c/marvel-linux-amd64"
    sha256 "698fd3d1ac0fee9dbd6b5a74f97598ba237d8aa7cf5ed289de1c972498cdcad0"
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
